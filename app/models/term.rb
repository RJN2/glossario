class Term < ActiveRecord::Base
	belongs_to :glossary
	default_scope -> { order('term ASC') }
	validates :term, presence: true, length: { maximum: 100 }
	validates :definition, presence: true
	validates :glossary_id, presence: true
end
