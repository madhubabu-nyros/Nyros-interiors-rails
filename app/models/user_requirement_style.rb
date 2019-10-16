class UserRequirementStyle < ApplicationRecord
	belongs_to :user_requirement, inverse_of: :user_requirement_styles
	
	# Display user_requirement_styles details in admin panel
	rails_admin do
    field :id
    field :content
    show do
      field :image do
			  pretty_value do
			     util = bindings[:object]
      		%{<img src="/assets/#{util.image}.png">}.html_safe
			  end
			end
			field :content
    end  
  end
end