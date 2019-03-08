class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  audited :comment_required => true
  audited if: :active?
  has_paper_trail
  def active
    last_login > 6.months.ago
  end
end 
