module UsersHelper
  def user_name(id)
    return nil unless id
    @user = User.find(id)
    { name: @user.name, profile_path: user_path(@user) }
  end
end