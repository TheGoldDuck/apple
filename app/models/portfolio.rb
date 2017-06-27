class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image
  # Demonstration Purposes
  def self.angular
    where(subtitle: 'Angular')
  end

  scope :portfolio_post, -> {where(subtitle: 'My great service')}
end
