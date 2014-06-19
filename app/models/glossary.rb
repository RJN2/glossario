class Glossary < ActiveRecord::Base
	validates :title, presence: true, length: { maximum: 60 }
	validates :status, presence: true
end
