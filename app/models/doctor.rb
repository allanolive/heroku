class Doctor < ApplicationRecord
  has_many :primary_care_recipients,
            class_name: 'Patient',
            inverse_of: 'primary_care_physician'

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
end
