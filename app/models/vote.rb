class Vote < ActiveRecord::Base
  belongs_to :music
  belongs_to :user
end
