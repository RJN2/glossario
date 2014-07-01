require 'spec_helper'

describe Glossary do
		before { @glossary = Glossary.new(title: "example") }

	subject { @glossary }

	it { should respond_to(:title) }
	it { should respond_to(:status) }
	it { should respond_to(:terms) }

	it { should be_valid }

	describe "when title is not present" do
		before { @glossary.title = '' }
		it { should_not be_valid }
	end

	describe "when title is too long" do
		before { @glossary.title = 'a' * 61 }
		it { should_not be_valid }
	end

	describe "created with default status" do
		its(:status) { should eq(1) }
	end

	describe "when status is not present" do
		before { @glossary.status = nil }
		it { should_not be_valid }
	end

	describe "term associations" do
		before { @glossary.save }
		let!(:term_Z) do
			FactoryGirl.create(:term, glossary: @glossary, term: "Zombie", definition: "an undead creature that likes brains")
		end
		let!(:term_A) do
			FactoryGirl.create(:term, glossary: @glossary, term: "Android", definition: "a humanoid looking robot")
		end

		it "should have the right terms in the right order" do
			expect(@glossary.terms.to_a).to eq [term_A, term_Z]
		end

		it "should destroy associated terms" do
			terms = @glossary.terms.to_a
			@glossary.destroy
			expect(terms).not_to be_empty
			terms.each do |term|
				expect(Term.where(id: term.id)).to be_empty
			end
		end
	end	
end
