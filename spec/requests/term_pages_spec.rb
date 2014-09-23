require 'spec_helper'

describe "Term pages" do
	subject { page }

	let(:glossary) { FactoryGirl.create(:glossary) }
	before { visit glossary_path(glossary) }

	describe "term creation", :js => true do
		
		before { find(:css, '#add-terms a').click }

		describe "with invalid information" do
			it "should not create a term" do
				expect do
					element = find('#term-new-submit')
					element.trigger('click')
					sleep 3
				end.not_to change(Term, :count)
			end

			describe "error messages" do
				before do
					element = find('#term-new-submit')
					element.trigger('click')
					sleep 3
				end
				it { should have_selector(:css, '#error_explanation') }
			end
		end

		describe "with valid information" do

			before do
				fill_in 'term_term', 				with: "android"
				fill_in 'term_definition',	with: "a humanoid looking robot that cannot be trusted"
			end

			it "should create a term" do
				expect do
					element = find('#term-new-submit')
					element.trigger('click')
					sleep 3
				end.to change(Term, :count).by(1)\
			end
		end
	end

	describe "term destruction" do
		
		let!(:term) { FactoryGirl.create(:term, glossary: glossary) }
		before do
		 visit glossary_path(glossary)
		end
		
		it "should delete a term", :js => true  do
			expect do
				find(:css, '#edit-terms a').click
				click_link "delete_term_#{term.id}"
				sleep 3
			end.to change(Term, :count).by(-1)
		end
	end
end