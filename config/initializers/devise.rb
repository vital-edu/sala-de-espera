Devise.setup do |config|
  # ==> Mailer Configuration
  config.mailer_sender = 'sala-de-espera@codecreates.website'

  # Configure the class responsible to send e-mails.
  # config.mailer = 'Devise::Mailer'

  # Configure the parent class responsible to send e-mails.
  config.parent_mailer = 'ActionMailer::Base'

  # ==> ORM configuration
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  config.authentication_keys = [:email]

  # Configure parameters from the request object used for authentication.
  # config.request_keys = []

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  # Tell if authentication through request.params is enabled. True by default.
  # config.params_authenticatable = true

  # Tell if authentication through HTTP Auth is enabled. False by default.
  # config.http_authenticatable = false

  # If 401 status code should be returned for AJAX requests. True by default.
  # config.http_authenticatable_on_xhr = true

  # The realm used in Http Basic Authentication. 'Application' by default.
  # config.http_authentication_realm = 'Application'

  # It will change confirmation, password recovery and other workflows
  # to behave the same regardless if the e-mail provided was right or wrong.
  # Does not affect registerable.
  config.paranoid = true

  # By default Devise will store the user in session. You can skip storage for
  # particular strategies by setting this option.
  config.skip_session_storage = [:http_auth]

  # By default, Devise cleans up the CSRF token on authentication to
  # avoid CSRF token fixation attacks.
  # config.clean_up_csrf_token_on_authentication = true

  # When false, Devise will not attempt to reload routes on eager load.
  # config.reload_routes = true

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 11

  # Set up a pepper to generate the hashed password.
  config.pepper = ENV["SECRET_KEY_BASE"]

  # Send a notification email when the user's password is changed
  # config.send_password_change_notification = false

  # ==> Configuration for :confirmable
  # A period that the user is allowed to access the website even without
  # confirming their account. Default is 0.days
  # config.allow_unconfirmed_access_for = 2.days

  # A period that the user is allowed to confirm their account before their
  # token becomes invalid.
  config.confirm_within = 2.days

  # If true, requires any email changes to be confirmed (exactly the same way as
  # initial account confirmation) to be applied.
  config.reconfirmable = true

  # Defines which key will be used when confirming an account
  # config.confirmation_keys = [:email]

  # ==> Configuration for :rememberable
  # The time the user will be remembered without asking for credentials again.
  # config.remember_for = 2.weeks

  # Invalidates all the remember me tokens when the user signs out.
  config.expire_all_remember_me_on_sign_out = true

  # If true, extends the user's remember period when remembered via cookie.
  # config.extend_remember_period = false

  # Options to be passed to the created cookie. For instance, you can set
  # secure: true in order to force SSL only cookies.
  config.rememberable_options = {secure: true}

  # ==> Configuration for :validatable
  # Range for password length.
  config.password_length = 8..128

  # fix-me: improve this email reges
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Configuration for :timeoutable
  config.timeout_in = 30.minutes

  # ==> Configuration for :lockable
  config.lock_strategy = :failed_attempts
  config.unlock_keys = [:email]
  config.unlock_strategy = :both
  config.maximum_attempts = 10
  config.unlock_in = 2.hour
  config.last_attempt_warning = true

  # ==> Configuration for :recoverable
  config.reset_password_keys = [:email]
  config.reset_password_within = 6.hours
  config.sign_in_after_reset_password = true

  # ==> Configuration for :encryptable
  config.encryptor = :scrypt
  SCrypt::Engine::DEFAULTS[:key_len] = 64
  SCrypt::Engine::DEFAULTS[:salt_size] = 32

  # ==> Scopes configuration
  # config.scoped_views = false
  # config.default_scope = :user
  # config.sign_out_all_scopes = true

  # ==> Navigation configuration
  # config.navigational_formats = ['*/*', :html]

  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete

  # ==> OmniAuth
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> Warden configuration
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  # ==> Mountable engine configurations
  # config.router_name = :my_engine
  # config.omniauth_path_prefix = '/my_engine/users/auth'
end
