class User < ActiveRecord::Base
  validates :name, :password, presence: true

  validates_uniqueness_of :name

  has_many :cellars

  def self.authenticate(user)
    found_user = find_by_name(user[:name])
    password = BCrypt::Engine.hash_secret user[:password], found_user.salt
    if found_user && found_user.password == password
      found_user
    end
  end

  def self.check_if_user_exists(user)
    user = find_by_name(user[:name])
    user
  end

  def self.create_new(name, password)
    @user = User.new
    @user.set_name(name)
    @user.set_password(password)
    if @user.save!
      @user
    else
      return nil
    end
  end

  def set_name(name)
    self.name = name
  end

  def set_password(password)
    self.salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret password, self.salt
  end

  def get_name
    self.name
  end

  def get_password
    self.password
  end
end