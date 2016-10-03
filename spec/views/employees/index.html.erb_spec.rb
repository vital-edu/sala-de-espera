require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        :name => "Name",
        :email => "Email",
        :score => 2
      ),
      Employee.create!(
        :name => "Name",
        :email => "Email",
        :score => 2
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
