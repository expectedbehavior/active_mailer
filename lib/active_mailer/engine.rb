module ActiveMailer

  class Engine < Rails::Engine

    initializer "active_mailer.load_app_instance_data" do |app|
      ActiveMailer.setup do |config|
        config.app_root = app.root
      end
    end

    initializer "active_mailer.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

  end

end
