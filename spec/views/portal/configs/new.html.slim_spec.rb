require 'rails_helper'

RSpec.describe "portal/configs/new", type: :view do
  before(:each) do
    assign(:portal_config, Portal::Config.new(
      :new => "MyString",
      :index => "MyString",
      :update => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders new portal_config form" do
    render

    assert_select "form[action=?][method=?]", portal_configs_path, "post" do

      assert_select "input#portal_config_new[name=?]", "portal_config[new]"

      assert_select "input#portal_config_index[name=?]", "portal_config[index]"

      assert_select "input#portal_config_update[name=?]", "portal_config[update]"

      assert_select "input#portal_config_destroy[name=?]", "portal_config[destroy]"
    end
  end
end
