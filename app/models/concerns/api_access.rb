module ApiAccess
  extend ActiveSupport::Concern

  def request(resource:, arguments:)
    HTTParty.get("#{end_point}/#{resource}", **auth, **arguments, format: :json)
  end

  def post(resource:, arguments:)
    HTTParty.post("#{end_point}/#{resource}", **auth, **arguments, format: :json)
  end
end
