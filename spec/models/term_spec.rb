require 'spec_helper'

describe Term do
	let(:glossary) { FactoryGirl.create(:glossary) }
	before { @term = glossary.terms.build(term: "example", definition: "this is an example") }

	subject { @term }

	it { should respond_to(:term) }
	it { should respond_to(:definition) }
	it { should respond_to(:acronym) }
	it { should respond_to(:glossary_id) }
	it { should respond_to(:glossary) }
	its(:glossary) { should eq glossary }

	it { should be_valid }

	describe "when glossary_id is not present" do
		before { @term.glossary_id = nil }
		it { should_not be_valid }
	end

	describe "when term is not present" do
		before { @term.term = " " }
		it { should_not be_valid }
	end

	describe "when term is too long" do
		before { @term.term = "a" * 101 }
		it { should_not be_valid }
	end

	describe "when definition is not present" do
		before { @term.definition = " " }
		it { should_not be_valid }
	end
	
	describe "when acronym is not present" do
		before { @term.acronym = " " }
		it { should be_valid }
	end

	describe "when acronym is too long" do
		before { @term.acronym = "a" * 11 }
		it { should_not be_valid }
	end
end