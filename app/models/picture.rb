class Picture < ApplicationRecord
    belongs_to :imageable, polymorphic: true
    mount_uploader :name, ImageUploader
    audited :comment_required => true
    audited associated_with: :imageable
    has_paper_trail
end
