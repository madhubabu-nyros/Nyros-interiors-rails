class UserRequirementGoal < ApplicationRecord
	belongs_to :user_requirement, inverse_of: :user_requirement_goals
end
