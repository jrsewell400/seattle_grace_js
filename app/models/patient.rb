class Patient <ApplicationRecord
  validates_presence_of :name, :age
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
  
  def self.order_age
    order(:age).reverse_order.distinct
  end 
  
end