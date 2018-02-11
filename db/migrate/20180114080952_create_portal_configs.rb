class CreatePortalConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :portal_configs do |t|
      t.string :end_point
      t.string :username
      t.string :password
      t.string :info
      t.numeric :version
      t.timestamps
    end
  end
end
