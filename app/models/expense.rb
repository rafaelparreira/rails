class Expense < ApplicationRecord
    validates :status, presence: true
    mount_uploader :picture, PictureUploader
    has_one :employee
end
