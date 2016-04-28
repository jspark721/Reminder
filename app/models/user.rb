class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists

  before_create :generate_auth_token

  def generate_auth_token
    loop do
      self.auth_token = SecureRandom.hex
      break unless User.find_by(auth_token: auth_token)
    end
  end

  def serialize
    hash = {}
    attributes.each { |key, val| hash[key] = val }
    hash
  end
end
