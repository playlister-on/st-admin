class Portal::User < ApplicationRecord
  include ApiAccess
  belongs_to :config
  delegate :end_point, to: :config

end
