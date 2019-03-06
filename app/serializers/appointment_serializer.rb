class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :patient
  has_one :doctor
end
