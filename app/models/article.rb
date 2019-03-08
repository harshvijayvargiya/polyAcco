class Article < ApplicationRecord
  has_many :pictures , as: :imageable
  accepts_nested_attributes_for :pictures , reject_if: :all_blank, allow_destroy: true
  paginates_per  3
  before_create :default_set

  scope :active_articles,-> { where(is_active: true) }
  scope :inactive_articles,-> { where(is_active: false) }  
  #audited :comment_required => true
  audited :update_with_comment_only => false
  audited max_audits: 2
  has_associated_audits
  audited if: :active?
  has_paper_trail
  def default_set
    self.is_active = false
  end
end
