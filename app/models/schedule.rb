class Schedule < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :title
    validates :content
    validates :start_time
    validates :end_time
  end
end
