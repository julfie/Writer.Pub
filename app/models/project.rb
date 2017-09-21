class Project < ActiveRecord::Base

    # Relationships
    # -----------------------------
    belongs_to :owner, class_name: "User", foreign_key: "owner_id"
    has_many :project_roles
    # has_many :project_roles, through: :project_roles TODO: delete?
    has_many :users, through: :project_roles

    # scopes
    # -----------------------------
    scope :alphabetical,  -> { order("title") }
    scope :chronological, -> { order("start_date") }
    scope :active,        -> { where("start_date <= ? and (end_date > ? or end_date is null)", Date.today, Date.today) }
    scope :completed,     -> { where("end_date <= ?", Date.today) }
    scope :for_title,     -> (title) { where("title LIKE ?", "#{title}%") }
    scope :for_category,  -> (category) { where("category LIKE ?", "#{category}%") }
    scope :for_genre,     -> (genre) { where("genre LIKE ?", "#{genre}%") }
    scope :for_owner,     -> (owner) { where("owner LIKE ?", "#{owner}%") }

    # Validations
    # -----------------------------
    validates_presence_of :title
    validates_presence_of :status
    validates_presence_of :genre
    validates_presence_of :category
    validates_uniqueness_of :title
    validates_inclusion_of :status, in: %w[active hiatus finished cancelled], message: "is not included in list of accepted status"
    validates_inclusion_of :preview_level, in: %w[hidden by_invitation preview published], message: "is not included in list of accepted preview levels"
    validates_date :start_date, on_or_before:  lambda { Date.current }
    validates_date :end_date, after: :start_date, allow_blank: true
    validate :owner_is_active, on: :create
    validate :is_unique_project?

    # Callbacks
    # -----------------------------
    before_save :is_ended?

    # Additional Methods
    # -----------------------------
    def time_length
        return (self.end_date - self.start_date).to_i
    end

    def cancel
        self.set_end_date
        self.status = "cancelled"
        self.save!
    end

    def owner_is_active
        return owner.active
    end

    def is_unique_project?
        return Project.for_title(self.title).for_owner(self.owner)
    end 

    def is_ended?
        if self.status == "completed" && self.end_date.nil?
            self.set_end_date = Date.today
        end
    # self.save!
    end

    def set_end_date
        self.end_date = Date.today
        self.save!
    end 

end
