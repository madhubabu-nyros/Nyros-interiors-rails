class UserRequirement < ApplicationRecord
	has_many :user_requirement_styles
	has_many :user_requirement_goals
  accepts_nested_attributes_for :user_requirement_styles, allow_destroy: true
  accepts_nested_attributes_for :user_requirement_goals, allow_destroy: true
  belongs_to :user, inverse_of: :user_requirements
  belongs_to :room, optional: true

  #get user email
  def user_email
    self.user.email
  end
  
  #get goal content
  def goal_content
    self.user_requirement_goals.pluck(:content).join(", ")
  end
  
  #get style image 
  def style_image
    @x = []
    self.user_requirement_styles.each do |s|
      @x.push(%{<img src="/assets/#{s.image}.png"><div style="text-align:center;width: 177px;">#{s.content}</div>})
    end
    return @x.split(",").join(" ").html_safe    
  end
  
  #get room image
  def room_image
    %{<img src="/assets/#{self.room.image}.png"><div style="text-align:center;width: 356px;">#{self.room.content}</div>}.html_safe
  end

  # Display user_requirement details in admin panel
  rails_admin do
    field :id
    field :user do 
      pretty_value do
        value.try(:email)
      end
    end
    show do
      field :user_email 
      field :furniture
      field :room_image
      field :goal_content
      field :style_image
    end  
  end
end