OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, '298608291235-csulummlvap1qvi3giso6i36evfu32pj.apps.googleusercontent.com', 'N574bW-S6UBFKXDFTGM2w89O', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
    provider :facebook, '387611394990392', 'be7262c462af976006f5f51449f60203', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end