class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :attachments
  has_many :media_directories

  # Callbacks
  before_save :assign_role

  private
  def assign_role
  	self.add_role 'user'
  end
end
