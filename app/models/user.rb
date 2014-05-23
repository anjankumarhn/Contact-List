class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  validates_confirmation_of :password, :unless => proc{|u| u.provider.present?}
  validates_presence_of :password, :on => :create, :unless => proc{|u| u.provider.present?}
  validates_presence_of :password_confirmation, :on => :create, :unless => proc{|u| u.provider.present?}
  validates_presence_of :firstname, :lastname, :email, :pincode, :address, :city, :state, :country, :unless => proc{|u| u.provider.present?}
  validates_uniqueness_of :email, :unless => proc{|u| u.provider.present?}
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, :unless => proc{|u| u.provider.present?}
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
end
