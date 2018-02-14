class Portal::PushForm
  extend ActiveModel::Naming
  include Tainbox
  attribute :message
  attribute :macs
  attribute :config_id

  def submit
    Portal::Config.find(config_id).push(message, to: macs)
  end
end
