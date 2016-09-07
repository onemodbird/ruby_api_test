class District < Organization
  belongs_to :state
  has_many :schools
end
