class Follow < ApplicationRecord
    validates :user_id, presence:true
    validates :follow_user_id, presence:true

    def user
        return User.find_by(id: self.user_id)
    end
end
