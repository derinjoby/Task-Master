Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, '1042949538661-96656sk1ne7ljjc2ivurtrupeuvdidvk.apps.googleusercontent.com', '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', scope: 'email,drive'
  end
  