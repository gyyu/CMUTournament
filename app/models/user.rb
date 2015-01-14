class User < ActiveRecord::Base
  belongs_to :team
  accepts_nested_attributes_for :team
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, on: :create

  has_secure_password


  def self.make_judge
    self.type = "judge"
  end
end
