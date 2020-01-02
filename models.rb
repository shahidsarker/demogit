class User < ActiveRecord::Base
  validates :email, :password, presence: true
end

class Dog < ActiveRecord::Base
end
