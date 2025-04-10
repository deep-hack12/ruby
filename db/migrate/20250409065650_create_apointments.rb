class CreateApointments < ActiveRecord::Migration[8.0]
  def change
    create_table :apointments do |t|
      t.integer :timing
      t.integer :identity

      t.timestamps
    end
  end
end
