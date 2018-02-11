require 'rails_helper'

RSpec.describe "portal/configs/show", type: :view do
  before(:each) do
    @portal_config = assign(:portal_config, Portal::Config.create!(
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
