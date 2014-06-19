require 'spec_helper'

describe "Glossary pages" do
	subject { page }

	describe "Index page" do
		before { visit glossaries_path }

		it { should have_selector('h1', text: 'Welcome') }
		it { should have_title(full_title('')) }
		it { should_not have_title("| Glossaries") }
	end
end