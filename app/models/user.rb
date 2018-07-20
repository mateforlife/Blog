class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :nickname, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :comments
  include PermissionsConcern

  def user_type
    case permission_level
    when 1
      'Estandar'
    when 2
      'Editor'
    when 3
      'Administrador'
    end
  end

  def avatar
    email_address = self.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    image_src = "https://www.gravatar.com/avatar/#{hash}"
  end
end
