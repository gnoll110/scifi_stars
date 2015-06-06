require 'rails_helper'

RSpec.describe "star/index.html.haml", type: :view do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    assign(:stars, [
      Star.create!(
        :name => "Barnard's Star",
      ),
      Star.create!(
        :name => "Deneb"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "p", :text => "Star Search".to_s, :count => 1
    #assert_select "tr>td", :text => "Deneb".to_s, :count => 1
  end
end
