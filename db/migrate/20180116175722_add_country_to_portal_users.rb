class AddCountryToPortalUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :portal_users, :country, :string, index: true
    add_column :portal_users, :city, :string, index: true
    add_column :portal_users, :external_id, :integer, unique: true
  end
end
