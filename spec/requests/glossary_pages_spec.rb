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
			it { should have_selector("a#glossary-#{g1.id}", text: g1.title.upcase) }
			it { should have_selector("a#glossary-#{g2.id}", text: g2.title.upcase) }
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

	describe "glossary creation", :js => true do

		before do
			visit root_path
		 	find(:css, '#add-glossary a').click 
		end

		describe "with invalid information" do
			it "should not create a glossary" do
				expect do
					element = find('#glossary-new-submit')
					element.trigger('click')
					sleep 3
				end.not_to change(Term, :count)
			end

			describe "error messages" do
				before do
					element = find('#glossary-new-submit')
					element.trigger('click')
					sleep 3
				end
				it { should have_selector(:css, '#error_explanation') }
			end
		end

		describe "with valid information" do

			before { fill_in 'glossary_title', with: "Lorem Ipsum" }

			it "should create a glossary" do
				expect do
					element = find('#glossary-new-submit')
					element.trigger('click')
					sleep 3
				end.to change(Glossary, :count).by(1)
			end

			describe "redirect to glossary" do
				before do
					element = find('#glossary-new-submit')
					element.trigger('click')
				end
				it { should have_title(full_title('Lorem Ipsum')) }
			end
		end
	end
end