# name: discourse-pianogroove
# about: Pianogroove Plugin for Discourse
# version: 0.1
# author: Angus McLeod

PRO_SIGNUP_URL = "https://www.pianogroove.com/pianogroove-pro"

after_initialize do
  module UploadsControllerExtension
    def show
      if !current_user && is_pdf
        return redirect_to PRO_SIGNUP_URL
      end
      super
    end
    
    def show_short
      if !current_user && is_pdf
        return redirect_to PRO_SIGNUP_URL
      end
      super
    end
    
    def is_pdf
      File.extname(request.original_url) == ".pdf"
    end
  end
  
  require_dependency 'uploads_controller'
  class ::UploadsController
    prepend UploadsControllerExtension
  end
end