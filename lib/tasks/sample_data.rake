namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_glossaries
		make_terms
	end
end

def make_glossaries
	3.times do |n|
		title = Faker::Lorem.words(rand(1..3)).join(' ')
		Glossary.create!(title: title)
	end
end

def make_terms
	glossaries = Glossary.all
	glossaries.each do |glossary|
		rand(4..10).times do
			term 				= Faker::Lorem.words(rand(1..3)).join(' ')
			definition 	= Faker::Lorem.sentence(rand(2..15)).chomp('.')
			Term.create!(term: term, definition: definition, glossary_id: glossary.id)	
		end
	end
end
