class Expense < ApplicationRecord
    validates :description, :date, :value, :status, :picture, presence: true
    validates :value, numericality: {greater_than: 0 }
    mount_uploader :picture, PictureUploader
    has_one :employee
end
