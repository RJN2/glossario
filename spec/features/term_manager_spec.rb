require 'spec_helper'

feature 'Term management' do

	let(:glossary) { FactoryGirl.create(:glossary) }
	let!(:term)	{ FactoryGirl.create(:term, glossary: glossary) }
	
	context 'User creates a term' do
		scenario 'they see the term on the page' do
			
			visit glossary_path(glossary)

			page.find('#term-add').click
			fill_in 'term', 				with: 'example term'
			fill_in 'definition', 	with: 'this is an example of a term in glossario'
			page.find('#term-new-submit').click

			expect(page).to have_css '.term a', 'example term'
		end
	end

	context 'User deletes a term' do
		scenario 'they see the term removed' do

			visit glossary_path(glossary)

			expect(page).to have_css "#term_#{term.id}"

			page.find('#term-edit').click
			page.find("#delete_term_#{term.id}").click

			expect(page).to_not have_css "#term_#{term.id}"

		end
	end
end
