class User < ApplicationRecord
  has_many :worktimes, dependent: :destroy
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  validates :postal_code, presence: true
  validates :prefecture_code, presence: true
  validates :city, presence: true
  validates :street, presence: true
  mount_uploaders :images, ImageUploader
  has_secure_password
  include JpPrefecture
     jp_prefecture :prefecture_code

  def prefecture_name
      JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
      self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
