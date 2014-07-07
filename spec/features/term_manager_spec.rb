require 'spec_helper'

feature 'User creates a term' do

	let(:glossary) { FactoryGirl.create(:glossary) }

	scenario 'they see the term on the page' do
		visit glossary_path(glossary)
		
		page.find('#term-add').click
		fill_in 'term', 				with: 'example term'
		fill_in 'definition', 	with: 'this is an example of a term in glossario'
		page.find('#glossary-new-submit').click

		expect(page).to have_css '.term', 'example term'
	end
end