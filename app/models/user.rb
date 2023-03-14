class User < ApplicationRecord

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  # validates_uniqueness_of :email
  validates :password, confirmation: true, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials (email_input, password) # the self. makes it a class method, without this it is an instance method
    # trim email
    stripped_email = email_input.strip
    email = stripped_email.downcase

    #get user by email
    user = self.where(email: email).first # if only .where, its an unfinished query. We need to append a .first to act as a semicolon to execute the statement. First is a limit 1. if we use a .get, we can get a list/array of results.

    if user.authenticate(password)
      return user
    else
      return nil
    end
  end

    # # users.password_hash in the database is a :string
    # include BCrypt

    # def password
    #   @password ||= Password.new(password_hash)
    # end
  
    # def password=(new_password)
    #   @password = Password.create(new_password)
    #   self.password_hash = @password
    # end
end
