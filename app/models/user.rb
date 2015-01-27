class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :idea
   has_many :comment
   
   validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message:"Email should contain @"}
   validates :name, :last_name, format: {with: /\A[a-z,A-Z]+\z/,message:"Only letters are valid"}
   
   def full_name
   		self.name + " " + self.last_name
   end

end
