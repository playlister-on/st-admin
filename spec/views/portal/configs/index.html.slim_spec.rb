require 'rails_helper'

RSpec.describe "portal/configs/index", type: :view do
  before(:each) do
    assign(:portal_configs, [
      Portal::Config.create!(
        :new => "New",
        :index => "Index",
        :update => "Update",
        :destroy => "Destroy"
      ),
      Portal::Config.create!(
        :new => "New",
        :index => "Index",
        :update => "Update",
        :destroy => "Destroy"
      )
    ])
  end

  it "renders a list of portal/configs" do
    render
    assert_select "tr>td", :text => "New".to_s, :count => 2
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "Update".to_s, :count => 2
    assert_select "tr>td", :text => "Destroy".to_s, :count => 2
  end
end
