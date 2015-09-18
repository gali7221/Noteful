class Note < ActiveRecord::Base
  
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  scope :sorted, lambda { order('created_at DESC') }
  
  
  def preview
    self.content #property of note stored in db. returning the content of the note instance
    self.content.slice(0...100).concat "...(readmore)"
  end

end
