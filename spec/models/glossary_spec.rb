require 'spec_helper'

describe Glossary do
	before { @glossary = Glossary.new(title: "example") }

	subject { @glossary }

	it { should respond_to(:title) }
	it { should respond_to(:status) }

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
end
