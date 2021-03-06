class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :advertisements, dependent: :destroy
  belongs_to :role
  before_validation :assign_role
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :omniauthable, :omniauth_providers => [:google_oauth2]
  #begin def self.from_omniauth(auth)
    #where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #user.provider = auth.provider
      #user.uid = auth.uid
      #user.email = auth.info.email
      #user.password = Devise.friendly_token[0,20]
    #end
  #end
  def self.find_or_create_from_auth_hash(access_token)
  data = access_token.info
  user = User.where(:email => data["email"]).first

   unless user
      password = Devise.friendly_token[0,20]
     user = User.create( id: access_token.id, full_name: data["name"], email: data["email"],
                         password: password, password_confirmation: password
    )
    end
    user
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create( id: access_token.id, full_name: data["name"], email: data["email"],
                          password: password, password_confirmation: password
      )
    end
    user
  end

  def assign_role
    self.role = Role.find_by name: 'Regular' if role.nil?
  end

  def admin?
    if role!= nil
    role.name == 'Admin'
    end
  end

  def moderator?
    if role!= nil
    role.name == 'Moderator'
    end
  end
end
