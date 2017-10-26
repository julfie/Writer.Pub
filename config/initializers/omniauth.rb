OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, '298608291235-csulummlvap1qvi3giso6i36evfu32pj.apps.googleusercontent.com', 'N574bW-S6UBFKXDFTGM2w89O', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
    provider :facebook, '387611394990392', 'be7262c462af976006f5f51449f60203', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
    # provider :medium, scope: 'basicProfile, listPublications'
    provider :medium, ENV['feef7b26e5c4aa4c0f362a0da06efa67cafc5ef0'], ENV['534c7bfcf9b5'], scope: 'basicProfile'
    provider :amazon, ENV['amzn1.application-oa2-client.92ebb3a6f53f46a78ac72c4de09d4c49'], ENV['604e2bdbd513ed54f94e1163d0a937cafe9cedceea833a66b73e8a3537bde671'],
    {
      :scope => 'profile postal_code' # default scope
    }
end