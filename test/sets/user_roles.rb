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
      @evan_a    = FactoryGirl.create(:user_role, user: @evan , role: @artist)
      @juli_a   = FactoryGirl.create(:user_role, user: @juliann, role: @artist)
      @jim_a    = FactoryGirl.create(:user_role, user: @jim, role: @artist)
      @ev_a     = FactoryGirl.create(:user_role, user: @ev, role:  @artist) 
    end
    
    def destroy_user_artist_roles
      @evan_a.delete
      @juli_a.delete
      @jim_a.delete
      @ev_a.delete 
    end

    def create_user_producer_roles
      @ev_p = FactoryGirl.create(:user_role, user: @ev, role: @producer)
      @juliann_p   = FactoryGirl.create(:user_role, user: @juliann, role:  @producer)
    end
    
    def destroy_user_producer_roles
      @ev_p.delete
      @juliann_p.delete
    end

    def create_user_mixer_roles
      @jim_p  = FactoryGirl.create(:user_role, user: @jim, role: @mixer)
    end
    
    def destroy_user_mixer_roles
      @jim_p.delete
    end

  end

end