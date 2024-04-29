RailsAdmin.config do |config|
  config.asset_source = :importmap

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.excluded_models = [Admin, CoachingSession]

  config.model Company do
    list do
      field :name
      field :description
      field :coaching_programs
      field :employees
    end

    edit do
      include_fields :name, :description
    end
  end

  config.model Coach do
    list do
      field :name
      field :email
      field :coaching_programs
    end

    edit do
      include_fields :email, :password, :password_confirmation, :name, :coaching_programs
    end
  end

  config.model CoachingProgram do
    list do
      field :name
      field :description
      field :company
      field :coaches
    end

    create do
      include_all_fields
      exclude_fields :coaches, :employees
    end

    edit do
      include_all_fields
    end
  end

  config.model Employee do
    parent Company
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except [Employee]
    end

    export
    bulk_delete
    show
    show_in_app

    edit do
      except [Employee]
    end

    delete do
      except [Employee]
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
