module MessageHelper

  def flash_message_please_login
    flash[:error] = "Please Register or Log In"
  end

  def flash_message_successful_login
    flash[:success] = "Successfully logged in"
  end

  def flash_message_successful_logout
    flash[:dark_background] = "Successfully logged out"
  end

  def flash_message_failed_registration
    flash[:error] = "Registration failed, please try again."
  end

  def flash_message_failed_login
    flash.now[:dark_background] = "Email and password combination does not exist"
  end

  def flash_message_failed_password_confirmation
    flash[:error] = "Password and password confirmation do not match. Please try again."
  end

  def flash_message_successful_account_creation
    flash[:success] = "Successfully logged in with new account"
  end
end