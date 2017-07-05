module UsersHelper
  def user_name(id)
    return nil unless id
    @user = User.find(id)
    x = {name: @user.name, profile_path: user_path(@user) }

    x
  end
end