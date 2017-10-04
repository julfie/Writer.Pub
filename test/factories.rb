FactoryGirl.define do

  factory :role do
    name "Editor"
    active true
  end
  
  factory :project do
    proj_description "A girl who pretends to be a boy because dragons and destiny"
    genre "fantasy"
    title "Eon"
    start_date 1.day.ago.to_date
    category "fiction"
    status "active"
    preview_level "published"
  end

  factory :project_role do
    invite_num 1
  end

  factory :user do
		first_name "Evan"
		last_name "Byrd"
		email "ebyrd@andrew.cmu.edu"
		phone_number "410-440-0887"
		username "ebyrd"
		password "Secret1!"
		password_confirmation "Secret1!"
		active true
  end
  
  factory :message do
		subject "Greetings"
		body "Hello, my name is Evan"
		read_status true
		send_date Date.today
		flagged false
  end
  
  factory :user_role do
    association :role
    association :user 
  end

end