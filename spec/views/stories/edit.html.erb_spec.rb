require 'rails_helper'

RSpec.describe "stories/edit", :type => :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :uploader => "",
      :title => "MyString",
      :description => "MyString",
      :latitude => "9.99",
      :longitude => "9.99"
    ))
  end

  it "renders the edit story form" do
    render

    assert_select "form[action=?][method=?]", story_path(@story), "post" do

      assert_select "input#story_uploader[name=?]", "story[uploader]"

      assert_select "input#story_title[name=?]", "story[title]"

      assert_select "input#story_description[name=?]", "story[description]"

      assert_select "input#story_latitude[name=?]", "story[latitude]"

      assert_select "input#story_longitude[name=?]", "story[longitude]"
    end
  end
end
