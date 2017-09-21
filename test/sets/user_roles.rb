module Contexts
  module UserRoles

    def create_user_roles
      create_user_artist_roles
      create_user_producer_roles
      create_user_mixer_roles
    end 

    def destroy_user_roles 
      destroy_user_artist_roles
      destroy_user_producer_roles
      destroy_user_mixer_roles
    end 

    # Context for both customer and employee users
    def create_user_artist_roles
      @bobby_a    = FactoryGirl.create(:user_role, user: @evan , role: @artist)
      @obeezy_a   = FactoryGirl.create(:user_role, user: @juliann, role: @artist)
      @fakey_a    = FactoryGirl.create(:user_role, user: @jim, role: @artist)
      @lazy_a     = FactoryGirl.create(:user_role, user: @jim, role:  @artist) 
    end
    
    def destroy_user_artist_roles
      @bobby_a.delete
      @obeezy_a.delete
      @fakey_a.delete
      @lazy_a.delete 
    end

    def create_user_producer_roles
      @bibby_p = FactoryGirl.create(:user_role, user: @ev, role: @producer)
      @dean_p   = FactoryGirl.create(:user_role, user: @juliann, role:  @producer)
    end
    
    def destroy_user_producer_roles
      @bibby_p.delete
      @dean_p.delete
    end

    def create_user_mixer_roles
      @mike_p  = FactoryGirl.create(:user_role, user: @jim, role: @mixer)
    end
    
    def destroy_user_mixer_roles
      @mike_p.delete
    end

  end

end