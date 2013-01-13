require "spec_helper"

describe "Static Pages" do
  describe "About Page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end
  end

  describe "Legal Page" do
    it "should have the content 'Legal Stuff'" do
      visit '/static_pages/legal'
      page.should have_content("Legal Stuff")
    end
  end
end