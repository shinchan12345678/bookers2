class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :books, dependent: :destroy
  
  validates :name,presence: true

  #railsで画像を処理するため、テーブルに画像を保存する必要がある
  def get_image
    unless image.attached?
      file_path=Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path),filename: "no_image.jpeg",content_type: 'image/jpeg')
    end
    image
  end
end
