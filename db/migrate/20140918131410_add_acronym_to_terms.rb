class AddAcronymToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :acronym, :string
  end
end
