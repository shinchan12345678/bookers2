class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :books, dependent: :destroy

  validates :name,presence: true, uniqueness: true,length: {minimum: 2,maximum: 20}
  validates :introduction,length: {maximum: 50}

  #railsで画像を処理するため、テーブルに画像を保存する必要がある
#   def get_image
#     unless image.attached?
#       file_path=Rails.root.join('app/assets/images/no_image.jpeg')
#       image.attach(io: File.open(file_path),filename: "no_image.jpeg",content_type: 'image/jpeg')
#     end
#     image
#   end
# end

  def get_profile_image
    unless self.profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    self.profile_image.variant(resize_to_limit: [100,100]).processed
  end
end