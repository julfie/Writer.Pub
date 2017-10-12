Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['387611394990392'], ENV['be7262c462af976006f5f51449f60203'],
        scope: 'public_profile', info_fields: 'name',
        scope: 'email', info_fields: 'email'
end