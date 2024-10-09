class UserSkill < ActiveRecord::Base
  belongs_to :user
  has_many :user_skills
  validates :tag_name, presence: true
  validates :task_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
