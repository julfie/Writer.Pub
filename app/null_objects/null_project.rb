class NullProject
    extend ActiveModel::Naming
    include ActiveModel::Conversion

    def persisted?
        false
    end

    def id 
        -1
    end

    def user_id
        -1
    end

    def proj_description
        "Hi, i'm Null"
    end

    def genre
        "Null"
    end

    def title
        "the Nullest Null"
    end

    def start_date
        1.day.ago.to_date
    end

    def end_date
        nil
    end

    def category
        "Null"
    end

end