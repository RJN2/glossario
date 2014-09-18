class Term < ActiveRecord::Base
	belongs_to :glossary
	default_scope -> { order('lower(term)') }
	validates :term, presence: true, length: { maximum: 100 }
	validates :definition, presence: true
	validates :glossary_id, presence: true
end
