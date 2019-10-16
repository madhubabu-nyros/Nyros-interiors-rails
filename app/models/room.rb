class Room < ApplicationRecord
  has_many :user_requirements

  # Display room details in admin panel
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
