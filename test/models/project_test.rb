require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:owner)
  should have_many(:project_roles)
  should have_many(:roles).through(:project_roles)
  should have_many(:users).though(:project_roles)

  # test validations with matchers
  should validate_presence_of(:title)
  should validate_presence_of(:status)
  should validate_presence_of(:genre)
  should validate_presence_of(:category)
  should validate_uniqueness_of(:title).case_sensitive
  should validate_inclusion_of(:status).in_array(%w[active hiatus finished cancelled])
  should validate_inclusion_of(:preview_level).in_array(%w[hidden by_invitation preview published])
  should validate_date :start_date, :on_or_before => :today
  should validate_date :end_date, :after => :start_date, :after_message => "end date cannot be before start date", :allow_nil

  # additional tests for status (not essential)
  should allow_value("active").for(:status)
  should allow_value("hiatus").for(:status)
  should allow_value("finished").for(:status)
  should allow_value("cancelled").for(:status)
  should_not allow_value("bad").for(:status)
  should_not allow_value("hacker").for(:status)
  should_not allow_value(10).for(:status)
  should_not allow_value("leader").for(:status)
  should_not allow_value(nil).for(:status)
  should_not allow_value("").for(:status)
  
  # additional tests for date
  should allow_value(Date.current).for(:start_date)
  should allow_value(1.day.ago.to_date).for(:start_date)
  should allow_value(1.day.from_now.to_date).for(:start_date)
  should_not allow_value("bad").for(:start_date)
  should_not allow_value(2).for(:start_date)
  should_not allow_value(3.14159).for(:start_date)
  
  context "Within context" do
    setup do 
      create_users
      create_projects
    end
    
    teardown do
      destroy_users
      destroy_projects
    end

    should "have a active user as its owner" do
      assert_not_nil @eon.owner
      assert @eon.owner.active
    end

    should "have a scope to list projects in alphabetical order" do
      assert_equal ["Ender's Game", "Ender's Shadow", "Eon", "Eragon", "My Life", "The Princess Bride"], Project.alphabetical.all.map(&:title)
    end

    should "have a scope to list projects chronologically" do
      assert_equal ["The Princess Bride", "Eragon", "Ender's Game", "Ender's Shadow", "Eon"], Project.chronological.all.map(&:title)
    end

    should "have working active scope" do 
      assert_equal ["Ender's Game", "Ender's Shadow", "Eon"], Project.active.all.map(&:title).sort
    end

    should "have working completed scope" do 
      assert_equal ["Eragon", "The Princess Bride"], Project.completed.all.map(&:title).sort      
    end

    should "have a scope to return all projects with a similar title" do
      assert_equal ["Ender's Game", "Ender's Shadow"], Project.for_name("Ender").title.all.map(&:title).sort 
      assert_equal ["Ender's Game", "Ender's Shadow"], Project.for_name("ende").title.all.map(&:title).sort 
    end

    should "have a scope to search by category" do
      assert_equal ["Ender's Game", "Ender's Shadow","Eragon", "The Princess Bride"], Project.for_category("fiction").title.all.map(&:title).sort 
      assert_equal ["My Life"], Project.for_category("nonfiction").title.all.map(&:title).sort 
    end 

    should "have a scope to search by genre" do
      assert_equal ["Ender's Game", "Ender's Shadow"], Project.for_genre("science fiction").title.all.map(&:title).sort 
      assert_equal ["Eon", "Eragon", "The Princess Bride"], Project.for_category("fantasy").title.all.map(&:title).sort 
    end

    should "have scope to search by owner" do
      assert_equal @juliann, Project.for_owner(@juliann)
    end

    should "verify project is not already in the system" do
      # uniqueness is Title+Owner
      @bad_project = FactoryGirl.build(:project, title: "Eon", owner: @juliann, genre: "Fantasy", start_date: Date.new(2017, 2, 1) , end_date: Date.new(2018, 1, 1))
      deny @bad_project.valid?
    end 

    should "verify the end date is after the start date" do
      @bad_project = FactoryGirl.build(:project, title: "Eon", owner: @juliann, genre: "Fantasy", start_date: 8.days.ago.to_date, end_date: 17.days.ago.to_date)
      deny @bad_project.valid?
    end 

    should "set end date of cancelled or completed project to today" do
      # callback to check is cancelled or completed (set end date to today)
      @ml.cancel
      assert_equal @ml.end_date, Date.today
      @EndersGame.complete
      assert_equal @EndersGame.end_date, Date.today      
    end

    should "correctly calculate length of project" do # TODO: P2
      # returns length of project as number of days
      # caculate start to end for complete/cancelled projects | start to today for active/hiatus projects
      assert_equal @EndersGame.timeLength, 365
      assert_equal @Eon.timeLength, 0
      @Eon.start_date = 5.days.ago.to_date
      assert_equal @Eon.timeLength, 5
    end

end
