class Todo < ActiveRecord::Base
  before_validation { |t| t.title.try(:strip!) }
  validates :title, presence: true
end
