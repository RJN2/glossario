require 'spec_helper'

describe "Glossary pages" do
	subject { page }

	describe "index page" do
		let!(:g1)	{ FactoryGirl.create(:glossary, title: "Eileen") }
		let!(:g2)	{ FactoryGirl.create(:glossary, title: "Bar") }

		before { visit root_path }

		it { should have_selector('h1#welcome-msg', text: 'Welcome') }
		it { should have_title(full_title('')) }
		it { should_not have_title("| Glossaries") }

		describe "glossaries" do
			it { should have_selector("a#glossary-#{g1.id}", text: g1.title) }
			it { should have_selector("a#glossary-#{g2.id}", text: g2.title) }
		end
	end

	describe "show page" do
		let(:glossary)	{ FactoryGirl.create(:glossary) }
		let!(:term_Z) do
			FactoryGirl.create(:term, glossary: glossary,
																term: "Zombie Walker",
																definition: "an undead creature that likes brains",
																acronym: "zw")
		end
		let!(:term_A) do
			FactoryGirl.create(:term, glossary: glossary,
																term: "Android Human",
																definition: "a humanoid looking robot that can't be trusted",
																acronym: "ah")
		end

		before { visit glossary_path(glossary) }

		it { should have_content(glossary.title) }
		it { should have_title(glossary.title) }

		describe "terms" do
			it { should have_content(term_Z.term) }
			it { should have_content(term_Z.acronym) }
			it { should have_content(term_A.term) }
			it { should have_content(term_A.acronym) }
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