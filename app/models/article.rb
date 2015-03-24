class Article < ActiveRecord::Base
	' Ensure title is at least 5 characters long '
	validates :title, presence: true, length: { minimum: 5 }
end
