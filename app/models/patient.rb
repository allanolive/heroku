class Patient < ApplicationRecord
  belongs_to :primary_care_physician,
              class_name: 'Doctor',
              foreign_key: 'doctor_id',
              inverse_of: 'primary_care_recipients'

  validates :first_name, presence: true
  validates :born_on, presence: true

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
end
