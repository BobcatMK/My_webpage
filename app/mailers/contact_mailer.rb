class ContactMailer < ActionMailer::Base
  default from: "do-not-reply@gmail.com"
  
  def contact_mail(contact)
    @kontakt = contact
    mail(to: ENV["OWNER_EMAIL"], from: @kontakt.email, :subject => "Website Contact")
  end
end
