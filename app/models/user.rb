class User < ApplicationRecord
  has_secure_password
  has_secure_token

  def self.valid_login?(email, password)
    user = find_by(email: email)
    if user && user.authenticate(password)
      user
    end
  end

  def allow_token_to_be_used_only_once
    regenerate_token
    touch(:token_created_at)
  end

  def logout
    invalidate_token
  end

  def with_unexpired_token(token, period)
    where(token: token).where('token_created_at >= ?', period).first
  end

  private

  def invalidate_token
    update_columns(token: nil)
    touch(:token_created_at)
  end
end
