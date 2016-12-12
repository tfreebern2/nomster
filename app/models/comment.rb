class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email

  RATINGS = {
    'One star'    => '1 star',
    'Two stars'   => '2 stars',
    'Three stars' => '3 stars',
    'Four stars'  => '4 stars',
    'Five stars'  => '5 stars'
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end

  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end
  
end
