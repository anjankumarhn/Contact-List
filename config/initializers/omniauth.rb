OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	configure do |config|
    	config.path_prefix = '/auth'
		provider :facebook, '634029143340254', '99c8a55e119258859bf21283130bea01', :ifrmae => true
	end
end