class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork, null: false, foreign_key: true, index: false
      t.references :viewer, null:false, foreign_key: {to_table: :users}, index: false
      t.index [:artwork_id,:viewer_id], unique: true

      t.timestamps
    end
  end
end
