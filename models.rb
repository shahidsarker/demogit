class User < ActiveRecord::Base
  # validates is an ActiveRecord function
  # symbols are treated as column names
  # runs these constraints before the .save function
  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 5, maximum: 8 }

  has_many :dogs
end

class Dog < ActiveRecord::Base
  belongs_to :user
end
