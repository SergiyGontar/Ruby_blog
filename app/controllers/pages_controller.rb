class PagesController < ApplicationController
	def about
		@about_us = "About us..." 
		@some_text = "Just message."
	end
end
