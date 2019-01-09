class Todo < ApplicationRecord
    belongs_to :category, optional: true

    def completed?
        !completed_at.blank?
    end
end
