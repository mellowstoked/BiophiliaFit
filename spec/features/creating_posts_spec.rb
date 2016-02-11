require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a job' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

 it "need an image to create a post" do
 	#visit the root rout
 	visit '/'
 	#click the "New Post" Link
 	click_link 'New Post'
 	# fill in the caption field (without touching the image field)
 	fill_in 'Caption', with: "No picture because YOLO"
 	# click the 'Create Post' button
 	click_button 'Create Post'
 	# expect the page to say, "Halt, you friend! You need an image to post here"
 	expect(page).to have_content("Halt, you friend! You need an image to post here!")
 end
end
