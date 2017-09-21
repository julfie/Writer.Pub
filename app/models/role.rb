class Role < ActiveRecord::Base
    include Activable

    # no relationships

    # scopes
    # -----------------------------
    scope :alphabetical, -> { order("name") }

    # Validations
    # -----------------------------
    validates_presence_of :name
    validates_uniqueness_of :name, case_sensitive: false
end
