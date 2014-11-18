FactoryGirl.define do
	factory :user do
    email 'test@ipsos.com'
    password 'f4k3p455w0rd'
  end

	factory :glossary do
		title 	"Example"
	end

	factory :term do
		term 				"test-driven development"
		definition	"a software development process that relies on the repetition of a very short development cycle: first the developer writes an (initially failing) automated test case that defines a desired improvement or new function, then produces the minimum amount of code to pass that test, and finally refactors the new code to acceptable standards."
		glossary
	end
end