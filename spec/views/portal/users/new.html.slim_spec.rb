require 'rails_helper'

RSpec.describe "portal/users/new", type: :view do
  before(:each) do
    assign(:portal_user, Portal::User.new(
      :new => "MyString",
      :index => "MyString",
      :update => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders new portal_user form" do
    render

    assert_select "form[action=?][method=?]", portal_users_path, "post" do

      assert_select "input#portal_user_new[name=?]", "portal_user[new]"

      assert_select "input#portal_user_index[name=?]", "portal_user[index]"

      assert_select "input#portal_user_update[name=?]", "portal_user[update]"

      assert_select "input#portal_user_destroy[name=?]", "portal_user[destroy]"
    end
  end
end
