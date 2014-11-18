require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)     { 'GLOSSAR.IO' }
    let(:page_title)  { '' }
  
    it_should_behave_like "all static pages"
    it { should_not have_title(full_title('| Home')) }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)     { 'Help' }
    let(:page_title)  { 'Help' }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    find(:css, '#help a').click
    expect(page).to have_title(full_title('Help'))
  end
end