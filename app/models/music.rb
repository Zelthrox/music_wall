class Music < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :url, presence: true

  def upvote
    self.vote_num += 1
  end

end