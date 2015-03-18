class User < ActiveRecord::Base
  has_secure_password

  def self.find_by_credentials(email, password)
    if User.find_by(email: email)
      user = User.find_by(email: email)
      user.authenticate(password)
    end
  end

  def generate_auth_token
    payload = { user_id: self.id }
    AuthToken.encode(payload)
  end
end
