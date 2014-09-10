module HelpingForSakeOfHelping
  def testing_google_drive(object)
    connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"])
    ss = connection.create_spreadsheet("test")
    ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.now
    ws[last_row, 2] = object.name
    ws[last_row, 3] = object.email
    ws[last_row, 4] = object.content
    ws.save
    connection.spreadsheet_by_title("test").delete
    if connection.spreadsheet_by_title("test") != nil
        raise "ERROR Test failed: spreadsheet has not been deleted!"
    end
    return "tested!"
  end
  
end