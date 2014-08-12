OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, '77af9lggyatifz', 'bjOWR3ZJ9x2dhG52', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end