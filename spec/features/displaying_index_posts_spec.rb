# Create multiple posts using factories.
require 'rails_helper'

feature 'Index displays a list of posts' do 
	scenario 'the index displays correct created job information' do 
		job_one = create(:post, caption: "This is post one")
		job_two = create(:post, caption: "This is the second post")
		# User visists the root route
		visit '/'
		# User can see the comments and images of the posts we've created.
		expect(page).to have_content("This is post one")
		expect(page).to have_content("This is the second post")
		expect(page).to have_css("img[src*='coffee']")
	end
end


