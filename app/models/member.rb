class Member < ActiveRecord::Base
  has_many :introduces, dependent: :destroy
  has_many :free_board, dependent: :destroy
  has_many :notice_board, dependent: :destroy
  has_many :graduate_board, dependent: :destroy
  has_many :sameage_board, dependent: :destroy
  acts_as_commontator
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
