class Comment < ApplicationRecord
  has_many :pictures , as: :imageable
  accepts_nested_attributes_for :pictures , reject_if: :all_blank , allow_destroy: true
  before_create :default_status
  scope :active_comments, -> { where( is_active: true )}
  scope :inactive_comments, -> { where( is_active: false )}
  paginates_per 5
  audited :comment_required => true
  has_associated_audits
  has_paper_trail
  private

  def default_status
    self.is_active = false
  end
end
