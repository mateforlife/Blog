class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :articles
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :about, required: false
  validates :sex, presence: true
  validates :nickname, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }

  has_attached_file :avatar, styles: { medium: '500x400', thumb: '100x100' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  enum permission_level: %i[normal editor admin]
  enum sex: %i[male female undefined]
  enum state: %i[disabled enabled]

  def allowed_to_sign_in?
    self.state == 'enabled'
  end

  def normal_user?
    self.permission_level == 'normal'
  end

  def editor?
    self.permission_level == 'editor'
  end

  def admin?
    self.permission_level == 'admin'
  end
end
