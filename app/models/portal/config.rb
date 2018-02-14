class Portal::Config < ApplicationRecord
  include ApiAccess
  has_many :users

  def load_users
    request_users
  end

  def push(message, to:)
    to.each do |mac|
      next if mac.blank?
      response = post(resource: "stb_msg/#{mac}", arguments: {body:{msg: message}})
    end
  end

  private

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
