class CreateGlossaries < ActiveRecord::Migration
  def change
    create_table :glossaries do |t|
      t.string :title
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
