module UsersHelper
  def user_name(id)
    return nil unless id
    @user = User.find(id)
    {name: @user.name, profile_path: user_path(@user)}
  end

  def users_training_plan(user_id)
    user = User.find(user_id)
    if user
      TrainingPlan.find_or_create_by(user_id: user_id) do |plan|
        plan.name = "Default training plan for user #{user.name}"
      end
    end
  end
end