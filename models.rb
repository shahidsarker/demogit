class User < ActiveRecord::Base
  validates :email, :password, presence: true

  has_many :dogs
end

class Dog < ActiveRecord::Base
  belongs_to :user
end
