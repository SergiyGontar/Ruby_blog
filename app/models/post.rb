class Post < ApplicationRecord
	has_many :comments

	# Fiels shouldn't be empty, use TRUE for automatical check params
	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true, length: {minimum: 15}
end
