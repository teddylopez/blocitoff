class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todo_lists, dependent: :destroy
  has_many :items, dependent: :destroy


  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  #Overide devise lookup on login for username
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_hash).first
    end
  end

end
