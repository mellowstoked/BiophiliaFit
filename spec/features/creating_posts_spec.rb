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

  it 'needs an image to create a post' do
	  visit '/'
  	click_link 'New Post'
  	fill_in 'Caption', with: "No picture because YOLO"
  	click_button 'Create Post'
  	expect(page).to have_content('Halt, you fiend! You need an image to post here!')
  end

  # create a post with factory_girl
  require 'spec_helper'
  feature 'Can view individual posts' do 
  	scenario 'Can click and view a single post' do 
  		post = create(:post)
  # visit '/'
  		visit '/'
  # click on an image link
  		find(:xpath, "//a[contains(@href, 'posts/1')]").click 
  # expect to be taken to the show page of our post
  		expect(page.current_path).to eq(post_path(post))
  	
  	end

  end
end




