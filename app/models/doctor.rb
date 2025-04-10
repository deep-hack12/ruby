class Doctor < ApplicationRecord
    has_many :apointments
    has_many :patiants, through: :apointments
end
