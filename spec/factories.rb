FactoryGirl.define do
	factory :glossary do
		title 	"Example"
		status 	1
	end

	factory :term do
		term 				"roshan"
		definition	"son of Divesh"
		glossary
	end
end