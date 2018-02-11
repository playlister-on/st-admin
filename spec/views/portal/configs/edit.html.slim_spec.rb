require 'rails_helper'

RSpec.describe "portal/configs/edit", type: :view do
  before(:each) do
    @portal_config = assign(:portal_config, Portal::Config.create!(
      :new => "MyString",
      :index => "MyString",
      :update => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders the edit portal_config form" do
    render

    assert_select "form[action=?][method=?]", portal_config_path(@portal_config), "post" do

      assert_select "input#portal_config_new[name=?]", "portal_config[new]"

      assert_select "input#portal_config_index[name=?]", "portal_config[index]"

      assert_select "input#portal_config_update[name=?]", "portal_config[update]"

      assert_select "input#portal_config_destroy[name=?]", "portal_config[destroy]"
    end
  end
end
