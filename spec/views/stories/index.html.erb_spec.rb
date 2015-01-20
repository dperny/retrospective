require 'rails_helper'

RSpec.describe "stories/index", :type => :view do
  before(:each) do
    assign(:stories, [
      Story.create!(
        :uploader => "",
        :title => "Title",
        :description => "Description",
        :latitude => "9.99",
        :longitude => "9.99"
      ),
      Story.create!(
        :uploader => "",
        :title => "Title",
        :description => "Description",
        :latitude => "9.99",
        :longitude => "9.99"
      )
    ])
  end

  it "renders a list of stories" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
