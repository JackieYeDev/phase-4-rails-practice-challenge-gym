class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validate :has_only_one_membership_with_gym

    def has_only_one_membership_with_gym
        membership = Membership.find_by(client_id: client_id, gym_id: gym_id)
        unless membership.nil?
            errors.add(:membership, "A client is only allowed to have one membership with a gym")
        end
    end
end
