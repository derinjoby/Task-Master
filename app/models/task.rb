class Task < ApplicationRecord
    enum :status, { open: 0, in_progress: 1, completed: 2 }
    validates :name, presence: true
    validates :deadline, presence: true
    validates :description, presence: true, length: { maximum: 250, message: "Description should not exceed 250 characters" }
    validates :status, presence: true, inclusion: { in: Task.statuses.keys }
    validates :high_priority, inclusion: { in: [true, false] }

    validate :deadline_must_be_in_the_future

    belongs_to :creator, class_name: "User", foreign_key: "user_id", optional: true
    belongs_to :assigned_user, class_name: "User", foreign_key: "assigned_user_id", optional: true
    
    

    private

    def deadline_must_be_in_the_future
      if deadline.present? && deadline < Date.today
        errors.add(:deadline, "can't be in the past")
      end
    end
    
  end
  