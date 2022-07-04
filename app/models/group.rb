class Group < ApplicationRecord
  has_one_attached :group_image

  has_many :group_users, foreign_key: "user_id", dependent: :destroy
  has_many :users, through: :group_users

  # has_many :belonged_groups, class_name: "GroupUser", foreign_key: "group_id", dependent: :destroy

  validates :name, length: { in: 2..20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }


  def get_group_image(width, height)
    unless group_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      group_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
      group_image.variant(resize_to_limit: [width, height])
  end
end
