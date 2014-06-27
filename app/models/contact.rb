class Contact < ActiveRecord::Base
  has_no_table
  
  column :name, :string
  column :email, :string
  column :content, :string
  
  validates_presence_of(:name)
  validates_presence_of(:email)
  validates_presence_of(:content)
  validates_format_of(:email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i)
  validates_length_of(:content, :maximum => 500)
  
  def injection_to_spreadsheet
    connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"])
    ss = connection.spreadsheet_by_title("My_blog_contacts")
    if ss.nil?
      ss = connection.create_spreadsheet("My_blog_contacts")
    end
    ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.now
    ws[last_row, 2] = self.name
    ws[last_row, 3] = self.email
    ws[last_row, 4] = self.content
    ws.save
  end
  
end