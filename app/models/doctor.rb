class Doctor <ApplicationRecord
  validates_presence_of :name, :specialty, :university
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients
end

# def list_unis
#   select('university').unique
# end
