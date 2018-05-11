class Portal::Config < ApplicationRecord
  include ApiAccess
  has_many :users

  def load_users
    request_users
  end

  def push(message, to:)
    wrapped_message = wrap_message(message)
    to.each do |mac|
      next if mac.blank?
      response = post(resource: "stb_msg/#{mac}", arguments: {body:{msg: wrapped_message}})
    end
  end

  private

  def wrap_message(message)
    <<~HTML
    <div style="position: absolute; top: 0px; bottom: 0px; left: 0px; right: 0px;">
      #{message}
    </div>
    <style>
      .mb_info .mb_info_lt_head,.mb_info_top_head,.mb_info_rt_head,.mb_info_lt_head,.mb_info_lb,.mb_info_main,.mb_info_rb {
        background: transparent !important;
      }
    </style>
    HTML
  end

  def request_users
    response = request(resource: :accounts, arguments: {})
    response["results"].each do |account|
      data = account.slice(*Portal::User.columns.map(&:name))
      next unless data['stb_mac'].present?
      Portal::User.find_or_create_by(stb_mac: data.delete('stb_mac'), config_id: id) do |user|
        if data["ip"].present?
          geo = GEO.lookup(data["ip"])
          data.merge!(
            {
              city: geo.city.name(:ru),
              country: geo.country.name(:ru),
            }
          )
        end

        user.attributes = data.merge(config_id: id)
        user.save
      end
    end
  end



  def auth
    { basic_auth: { username: username, password: password } }
  end
end
