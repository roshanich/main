class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|
      t.string :url
      t.string :title
      t.string :desc
      t.binary :image
      t.integer :price

      t.timestamps
    end
  end
end
