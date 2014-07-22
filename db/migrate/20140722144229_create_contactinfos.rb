class CreateContactinfos < ActiveRecord::Migration
  def change
    create_table :contactinfos do |t|
      t.string :name_surname
      t.string :facebook
      t.string :twitter
      t.string :email_address
      t.string :phone_number

      t.timestamps
    end
  end
end
