require 'rails_helper'

RSpec.describe "portal/users/show", type: :view do
  before(:each) do
    @portal_user = assign(:portal_user, Portal::User.create!(
      :new => "New",
      :index => "Index",
      :update => "Update",
      :destroy => "Destroy"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/New/)
    expect(rendered).to match(/Index/)
    expect(rendered).to match(/Update/)
    expect(rendered).to match(/Destroy/)
  end
end
