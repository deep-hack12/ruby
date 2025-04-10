class CreateDoctors < ActiveRecord::Migration[8.0]
  def change
    create_table :doctors do |t|
      t.string :title
      t.integer :number

      t.timestamps
    end
  end
end
