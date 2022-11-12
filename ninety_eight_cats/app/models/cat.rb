class Cat < ApplicationRecord
    CAT_COLORS = %w(black white spotted orange tortoise)
    validates :name, :sex, :birth_date, :color, presence: true
    validates :color, inclusion: { in: CAT_COLORS }
    validates :sex, inclusion: { in: %w(m f M F) }
    validate :birth_date_can_not_be_in_future





    def birth_date_can_not_be_in_future
        if birth_date.present && birth_date > Date.today
            errors.add(:birth_date, "birthday can't be in the future")
        end
    end

    def age
        Date.today.year - birth_date.year
    end

end
