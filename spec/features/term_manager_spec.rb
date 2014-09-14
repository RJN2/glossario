require 'spec_helper'

feature 'Term management' do

	let(:glossary) { FactoryGirl.create(:glossary) }
	let!(:term)	{ FactoryGirl.create(:term, glossary: glossary) }
	
	context 'User creates a term' do
		scenario 'they see the term created' do
		end
	end

	context 'User edits a term' do
		scenario 'they see the term updated' do
		end
	end

	context 'User deletes a term' do
		scenario 'they see the term removed' do
		end
	end
end
