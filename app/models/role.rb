class Role < ActiveRecord::Base
    include Activable

    # no relationships

    # scopes
    # -----------------------------
    scope :alphabetical, -> { order("last_name, first_name") }
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }

    # Validations
    # -----------------------------
    validates_presence_of :name
    validates_presence_of :active
    validates_uniqueness_of :name, case_insensitive
end
