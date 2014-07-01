class Glossary < ActiveRecord::Base
	has_many :terms, dependent: :destroy
	validates :title, presence: true, length: { maximum: 60 }
	validates :status, presence: true
end
