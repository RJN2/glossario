class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :term
      t.string :definition
      t.integer :glossary_id

      t.timestamps
    end
  end
end
