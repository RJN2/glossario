class Term < ActiveRecord::Base
	belongs_to :glossary
	default_scope -> { order('lower(term)') }
	validates :term, presence: true, length: { maximum: 100 }
	validates :acronym, length: { maximum: 10 }
	validates :definition, presence: true
	validates :glossary_id, presence: true

	def acronym=(s)
		write_attribute(:acronym, s.to_s.upcase)
	end
end
