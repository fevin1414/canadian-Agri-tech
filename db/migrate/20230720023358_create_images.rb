class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.references :product, null: false, foreign_key: true
      t.string :filename
      t.string :file_path

      t.timestamps
    end
  end
end
