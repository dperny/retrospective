require 'rails_helper'

RSpec.describe "stories/new", :type => :view do
  before(:each) do
    assign(:story, Story.new(
      :uploader => "",
      :title => "MyString",
      :description => "MyString",
      :latitude => "9.99",
      :longitude => "9.99"
    ))
  end

  it "renders new story form" do
    render

    assert_select "form[action=?][method=?]", stories_path, "post" do

      assert_select "input#story_uploader[name=?]", "story[uploader]"

      assert_select "input#story_title[name=?]", "story[title]"

      assert_select "input#story_description[name=?]", "story[description]"

      assert_select "input#story_latitude[name=?]", "story[latitude]"

      assert_select "input#story_longitude[name=?]", "story[longitude]"
    end
  end
end
