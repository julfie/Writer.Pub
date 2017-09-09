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
    status "complete"
  end

  factory :project_role do
    project_id 1
    role_id 1
    user_id 1
    invite_num 1
  end

end