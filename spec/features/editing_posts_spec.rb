# create a job with factory_girl
require 'rails_helper'
feature 'Editing posts' do 
	background do #wtf is background
		job = create(:post)
# visit the root route
		visit '/'
# click the image of the post we created with factory_girl
		find(:xpath, "//a[contatins(@href, 'posts/1')]").click
# click the 'edit post' link
		click_link 'Edit Post'
	end

# => create the scenario
scenario 'Can edit a post' do 
# fill in 'Caption' with "Oh god, you weren't meant to see this picture"
	fill_in 'Caption', with: "Oh god, you weren't meant to see this picture"
# click the 'Update Post' button
	click_button 'Update Post'
# expect the page to have content saying "Post update hombre."
	expect(page).to have_content("Post updated hombre")
# expect the page to have content saying "Oh god, you weren't meant to see this picture."
	expect(page).to have_content("Oh god, you weren't meant to see this picture.")
	end
end