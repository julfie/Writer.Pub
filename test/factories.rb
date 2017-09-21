FactoryGirl.define do
  factory :role do
    name "Editor"
    active true
  end
  
  factory :project do
    owner_id 1
    proj_description "A girl who pretends to be a boy because dragons and destiny"
    genre "Fantasy"
    title "Eon"
    start_date Date.today
    end_date nil
    category "Fiction"
    status "active"
    preview_level "public"
  end

  factory :project_role do
    project_id 1
    role_id 1
    user_id 6
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
  
  # factory :message do
	# 	subject "Greetings"
	# 	body "Hello, my name is Evan"
	# 	read_status true
	# 	send_date Date.today
	# 	flagged false
	# end

end