require "rails_helper.rb"

  #def web_development
  #  @post_all = Post.all
  #  @sort_reverse = @post_all.sort.reverse
  #end


describe "testing web_development subpage" do
  before(:each) do
    @web_dev_post = Post.create(:title => "This is title",:body => "body main content",:short => "short content of this post",:date => "20.06.2014")
  end
  
  it "should have proper content" do
    visit web_development_path
    expect(page).to(have_title("MK Web development"))
    expect(page).to(have_content(@web_dev_post.title.upcase))
    expect(page).to(have_content(@web_dev_post.short))
    expect(page).to(have_content(@web_dev_post.date))
    expect(page).to(have_selector("a[href='/web%20development/#{@web_dev_post.id}']"))
  end
  
  it "should redirect to post on clicking link" do
    visit web_development_path
    click_link("web_development_#{@web_dev_post.id}")
  end
  
  it "should have proper content inside each post" do
    visit web_development_path  
    click_link("web_development_#{@web_dev_post.id}")
    expect(page).to(have_title("MK #{@web_dev_post.title}"))
    expect(page).to(have_content(@web_dev_post.title.upcase))
    expect(page).to(have_content(@web_dev_post.date))
    expect(page).to(have_content(@web_dev_post.body))
    expect(page).to(have_selector("input[type='submit']"))
  end
  
  it "should redirect when you want to add new comment" do
    visit web_development_path
    click_link("web_development_#{@web_dev_post.id}")
    click_button("add_comment")
    expect(page).to(have_content(@web_dev_post.title))
    expect(page).to(have_selector("input[type='text']"))
    expect(page).to(have_selector("textarea"))
    expect(page).to(have_selector("input[type='submit']"))
  end
  
  it "should redirect back when clicking 'go back' button" do
    visit web_development_path
    click_link("web_development_#{@web_dev_post.id}")
    click_button("add_comment")
    expect(page).to(have_selector("input[value='Go back']"))
    click_button("Go back")  
    expect(page).to(have_title("MK #{@web_dev_post.title}"))  
    expect(page).to(have_selector('input[value="Add new comment!"]'))
  end
  
  it "shouldn't allow comment with invalid information to be saved in database" do
    visit web_development_path
    click_link("web_development_#{@web_dev_post.id}")
    click_button("add_comment")
    fill_in("Name",:with => "")
    fill_in("Content",:with => "")
    click_button("Save")
    expect(page).to(have_content("prohibited this comment from being saved"))
  end
  
  it "should allow comment with valid information to be saved in database, it's root comment it shouldn't be nested" do
    visit web_development_path
    click_link("web_development_#{@web_dev_post.id}")
    click_button("add_comment")
    fill_in("Name",:with => "Myvalidname")
    fill_in("Content",:with => "My valid content")
    click_button("Save")
    expect(page).not_to(have_content("prohibited this comment from being saved"))
    expect(page).not_to(have_css("div.replies"))    
  end
  
  it "should be able to reply to existing comments and see the comment that user is replying to, should be able to save it and this reply comment should be nested" do
    visit web_development_path
    click_link("web_development_#{@web_dev_post.id}")
    click_button("add_comment")
    fill_in("Name",:with => "Myvalidname")
    fill_in("Content",:with => "My valid content")
    click_button("Save")
    expect(page).not_to(have_content("prohibited this comment from being saved"))
    expect(page).to(have_content("My valid content"))
    expect(page).to(have_content("Reply"))
    click_link("Reply")
    expect(page).to(have_content("Myvalidname"))
    expect(page).to(have_content("My valid content"))
    fill_in("Name",:with => "Thisisreply")
    fill_in("Content",:with => "This is reply to previous comment")
    click_button("Save")
    expect(page).to(have_content("This is reply to previous comment"))
    expect(page).to(have_css("div.replies"))     
  end
end
