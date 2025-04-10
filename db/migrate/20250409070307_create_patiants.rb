class CreatePatiants < ActiveRecord::Migration[8.0]
  def change
    create_table :patiants do |t|
      t.string :name
      t.string :doctor

      t.timestamps
    end
  end
end
