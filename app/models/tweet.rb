class Tweet < ApplicationRecord
    validates :content, presence: true
    validates :content, length: { minimum: 1 }
    validates :content, length: { maximum: 140 }
end
