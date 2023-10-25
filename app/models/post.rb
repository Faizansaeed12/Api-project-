class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user
  acts_as_paranoid

  def soft_delete
    update(deleted_at: Time.current)  
  end

end
