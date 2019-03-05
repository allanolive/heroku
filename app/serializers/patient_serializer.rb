class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :diagnosis, :born_on, :doctor_id
end
