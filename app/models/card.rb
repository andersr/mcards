class Card < ActiveRecord::Base
  validates :phrase, :presence => {:message => "Please enter a card phrase"}
end
