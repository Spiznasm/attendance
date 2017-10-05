module UsersHelper

  def max_users
    User.count >= 2 ? true : false
  end

end
