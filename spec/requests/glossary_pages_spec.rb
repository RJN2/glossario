require 'spec_helper'

describe "Glossary pages" do
	subject { page }

	describe "Index page" do
		let!(:g1)	{ FactoryGirl.create(:glossary, title: "Eileen") }
		let!(:g2)	{ FactoryGirl.create(:glossary, title: "Bar") }

		before { visit root_path }

		it { should have_selector('h1#welcome-msg', text: 'Welcome') }
		it { should have_title(full_title('')) }
		it { should_not have_title("| Glossaries") }

		describe "glossaries" do
			it { should have_content(g1.title) }
			it { should have_content(g2.title) }
		end
	end


	describe "glossary creation" do
		before { visit root_path }

		describe "with invalid information" do
			it "should not create a glossary" do
				expect { click_button "Post" }.not_to change(Glossary, :count)
			end

			describe "error messages" do
				before { click_button "Post" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do

			before { fill_in 'glossary_title', with: "Lorem Ipsum" }
			it "should create a glossary" do
				expect { click_button "Post" }.to change(Glossary, :count).by(1)
			end
		end
	end
end