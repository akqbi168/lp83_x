class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|

      t.string :partner_image_id
      t.string :link
      t.string :name
      t.integer :tag_id
      t.boolean :published
      t.timestamps
    end
  end
end