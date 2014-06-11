require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("Glossario | Home")
    end
  end

  describe "Help page" do
  	it "should have the content 'Sample App'" do
  		visit '/static_pages/help'
  		expect(page).to have_content('Help')
  	end

  	it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("Glossario | Help")
    end
  end
end