require 'spec_helper'

describe "Glossary pages" do
	subject { page }

	describe "Index page" do
		let(:g1)	{ FactoryGirl.create(:glossary, title: "Foo") }
		let(:g2)	{ FactoryGirl.create(:glossary, title: "Bar") }

		before { visit glossaries_path }

		it { should have_selector('h1', text: 'Welcome') }
		it { should have_title(full_title('')) }
		it { should_not have_title("| Glossaries") }

		describe "glossaries" do
			it { should have_content(g1.title) }
			it { should have_content(g2.title) }
		end
	end

	describe "Show page" do
		let(:glossary) { FactoryGirl.create(:glossary) }
		before { visit glossary_path(glossary) }

		it { should have_selector('h1', text: glossary.title) }
		it { should have_title(full_title(glossary.title)) }
	end
end