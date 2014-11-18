require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "Glossary pages" do
	subject { page }

	describe "index page" do
		let!(:g1)	{ FactoryGirl.create(:glossary, title: "Eileen") }
		let!(:g2)	{ FactoryGirl.create(:glossary, title: "Bar") }
		let(:user) { FactoryGirl.create(:user) }

		before do
			login_as(user, scope: :user)
			visit root_path
		end

		it { should have_selector('h1#welcome-msg', text: 'Welcome') }
		it { should have_title(full_title('')) }
		it { should_not have_title("| Glossaries") }

		describe "glossaries" do
			it { should have_selector("#glossary_#{g1.id} .title", text: g1.title.upcase) }
			it { should have_selector("#glossary_#{g2.id} .title", text: g2.title.upcase) }
		end
	end

	describe "show page" do
		let(:glossary)	{ FactoryGirl.create(:glossary) }
		let(:user) { FactoryGirl.create(:user) }
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

		before do
			login_as(user, scope: :user)
			visit glossary_path(glossary)
		end

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
		
		let(:user) { FactoryGirl.create(:user) }

		before do
			login_as(user, scope: :user)
			visit root_path
		 	find(:css, '#add a').click 
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

	describe "glossary update", :js => true do

		let!(:glossary) { FactoryGirl.create(:glossary) }
		let(:user) { FactoryGirl.create(:user) }
		
		before do 
			login_as(user, scope: :user)
			visit root_path
		end

		before do
			find(:css, '#edit a').click
			find(:css, "#glossary_#{glossary.id} .link").click
			sleep 3
			fill_in 'glossary_title', with: "updated example"
		end

		it "should edit a glossary" do
			expect do
				element = find('#glossary-new-submit')
				element.trigger('click')
				sleep 3
			end.to change { glossary.reload.title }.from("Example").to("updated example")
		end
	end

	describe "glossary destruction" do

		let!(:glossary) { FactoryGirl.create(:glossary) }
		let(:user) { FactoryGirl.create(:user) }
		
		before do
			login_as(user, scope: :user)
			visit root_path
		end

		it "should delete a glossary", :js => true do
			expect do
				find(:css, '#edit a').click
				find(:css, "#delete_glossary_#{glossary.id}").click
				sleep 3
			end.to change(Glossary, :count).by(-1)
		end
	end
end