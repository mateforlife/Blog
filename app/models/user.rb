class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :nickname, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :comments

  enum permission_level: %i[normal editor admin]

  def is_normal_user?
    self.permission_level == 'normal'
  end

  def is_editor?
    self.permission_level == 'editor'
  end

  def is_admin?
    self.permission_level == 'admin'
  end

  def avatar
    email_address = self.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    image_src = "https://www.gravatar.com/avatar/#{hash}"
  end
end
