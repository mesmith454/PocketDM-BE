class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :party
      t.integer :level
      t.text :c_notes
      t.text :dm_notes

      t.timestamps
    end
  end
end
