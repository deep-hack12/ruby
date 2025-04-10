class AddNumberToApointment < ActiveRecord::Migration[8.0]
  def change
    add_reference :apointments, :patiant, null: false, foreign_key: true
  end
end
