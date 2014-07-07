require 'spec_helper'

describe "Term pages" do
	subject { page }

	let(:glossary) { FactoryGirl.create(:glossary) }
	before { visit glossary_path(glossary) }

	describe "term creation" do
		describe "with invalid information" do
			it "should not create a term" do
				expect { click_button "Post" }.not_to change(Term, :count)
			end

			describe "error messages" do
				before { click_button "Post" }
				it { should have_content("error") }
			end
		end

		describe "with valid information" do

			before do
				fill_in 'term_term', 				with: "android"
				fill_in 'term_definition',	with: "a humanoid looking robot that cannot be trusted"
			end

			it "should create a term" do
				expect { click_button "Post" }.to change(Term, :count).by(1)
			end
		end
	end

	describe "term destruction" do
		let(:term) { FactoryGirl.create(:term) }

		it "should delete a term" do
			expect { click_link "delete" }.to change(Term, :count).by(-1)
		end
	end
end