class RemoveStatusFromGlossary < ActiveRecord::Migration
  def change
    remove_column :glossaries, :status, :integer
  end
end
