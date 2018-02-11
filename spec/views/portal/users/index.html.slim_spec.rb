require 'rails_helper'

RSpec.describe "portal/users/index", type: :view do
  before(:each) do
    assign(:portal_users, [
      Portal::User.create!(
        :new => "New",
        :index => "Index",
        :update => "Update",
        :destroy => "Destroy"
      ),
      Portal::User.create!(
        :new => "New",
        :index => "Index",
        :update => "Update",
        :destroy => "Destroy"
      )
    ])
  end

  it "renders a list of portal/users" do
    render
    assert_select "tr>td", :text => "New".to_s, :count => 2
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "Update".to_s, :count => 2
    assert_select "tr>td", :text => "Destroy".to_s, :count => 2
  end
end
