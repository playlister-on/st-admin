class CreatePortalUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :portal_users do |t|
      t.macaddr :stb_mac, index: true
      t.inet :ip, index: true
      t.string :ls
      t.string :version
      t.integer :status
      t.boolean :additional_services_on
      t.datetime :last_active, index: true
      t.string :login, index: true
      t.numeric :account_balance
      t.boolean :online
      t.string :full_name, index: true
      t.string :phone, index: true
      t.string :stb_sn
      t.string :stb_type, index: true
      t.timestamps
    end
  end
end
