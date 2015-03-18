class User < ActiveRecord::Base
  has_secure_password

  def self.find_by_credentials(email, password)
    if user = User.find_by(email: email)
      user.authenticate(password)
    end
  end

  def generate_auth_token
    payload = { user_id: self.id }
    Auth::Token.encode(payload)
  end
end
