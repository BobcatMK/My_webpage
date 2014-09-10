require "rails_helper.rb"

 # def contact
 #   @mail = Mailinglist.new
 #   @contact = Contact.new
 #   @contactinfo = Contactinfo.find(1)
 # end


describe "Testing whole contact page functionality" do
  let!(:contactinfo) { Contactinfo.create(:name_surname => "Matthew Kilan",:facebook => "https://www.facebook.com/mateusz.kilan",:twitter => "https://twitter.com/MateuszKilan1",:email_address => "matthew.kilan@gmail.com",:phone_number => "790-680-882",:github => "https://github.com/BobcatMK") }
  #subject { contactinfo.email_address }
  it "should have contact informations" do
    visit "/contact"
    expect(contactinfo.email_address).to(include("@"))
    expect(contactinfo.email_address).to(include("."))
    expect(contactinfo.name_surname).not_to(be_nil)
    expect(contactinfo.facebook).not_to(be_nil)
    expect(contactinfo.twitter).not_to(be_nil)
    expect(contactinfo.phone_number).not_to(be_nil)
    expect(contactinfo.github).not_to(be_nil)
  end
  
end

describe "Testing mailer" do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @test = Contact.new(:name => "Zdzisiu Potrawka",:email => "matthew.kilan@gmail.com",:content => "Test test test")
    ContactMailer.contact_mail(@test).deliver
  end
  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it "should send emails!" do
    #ActionMailer::Base.deliveries.count.should == 1
    expect(ActionMailer::Base.deliveries.count).to(eq(1))
  end
    
  it "is sending email to correct recipient" do
    #ActionMailer::Base.deliveries.first.to.should == [@test.email]
    expect(ActionMailer::Base.deliveries.first.to).to(eq([@test.email]))
  end
  
  it "should have default title" do
    #ActionMailer::Base.deliveries.first.subject.should == "Website Contact"
    expect(ActionMailer::Base.deliveries.first.subject).to(eq("Website Contact"))
  end
  
  it "should be sent from website viewer" do
    #ActionMailer::Base.deliveries.first.from.should == ["matthew.kilan@gmail.com"]
    expect(ActionMailer::Base.deliveries.first.from).to(eq(["matthew.kilan@gmail.com"]))
  end
 
end

describe "Testing googlestylesheets" do
  before(:each) do
    @set2 = Contact.new(:name => "Mateusz Tester",:email => "matthew.kilan@gmail.com",:content => "test content and nothing more")
    @contact = Contact.new
    @contactinfo = Contactinfo.create;
    @mail = Mailinglist.new
  end
  
  it "should interact with google drive, create new stylesheet , insert data and delete it, used spec/support/helping_for_sake_of_helping.rb" do
    visit "/contact"
    fill_in("imeil",:with => "matthew.kilan@gmail.com")
    fill_in("imie",:with => "mam duze sombrero")
    fill_in("zawartosc",:with => "Some test content")
    click_button("submitform_nr2") # Uncomment if you want to test it through controller and model
    #expect(testing_google_drive(@set2)).to(eq("tested!")) # Uncomment if you want to test it through test helper method
  end

  it "should not interact with google drive if any data is invalid" do
    visit "/contact"
    fill_in("imeil",:with => "")
    fill_in("imie",:with => "")
    fill_in("zawartosc",:with => "")
    click_button("submitform_nr2")
  end
  
end

describe "Testing Mailinglist Subscription" do
  before(:each) do
    @contact = Contact.new
    @contactinfo = Contactinfo.create;
    @mail = Mailinglist.new
  end
  
  it "Should add emails to mailchimp mailing list with valid data" do
    visit "/contact"
    fill_in("email_mailinglist",:with => "abra@kadabraabrabara22s.pl")
    click_button("submit_mailinglist")
  end
  
  it "should fail adding email if verification fails" do
    visit "contact"
    fill_in("email_mailinglist",:with => "wrongemail")
    click_button("submit_mailinglist")
  end
end