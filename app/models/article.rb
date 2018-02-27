class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true, uniqueness: true, length: {minimum:3, maximum:50}
  validates :body, presence: true, length: {minimum:20, maximum:500}
  before_create :set_visits_count
  has_attached_file :cover, styles: { medium: "1280x720", thumb: "800x600"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  def update_visits_count
    self.save if self.visits_count.nil?
    self.update(visits_count: self.visits_count + 1)
  end   
  private
    def set_visits_count 
      self.visits_count = 0
    end  
end
