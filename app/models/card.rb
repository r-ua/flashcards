class Card < ActiveRecord::Base

  before_save :set_review_date
  validates :original_text, :translated_text, :review_date, presence: true
  validate  :translated_not_original

  def translated_not_original
  	if translated_text.downcase == original_text.downcase
  	  errors.add(:original_text, "Error")
    end
  end
  
  def set_review_date
    self.review_date == 3.days.from_now
  end

end
