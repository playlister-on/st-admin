class AddConfigIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :portal_users, :config_id, :integer, index: true
  end
end
