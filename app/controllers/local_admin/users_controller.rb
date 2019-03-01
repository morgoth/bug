class LocalAdmin::UsersController < LocalAdmin::ApplicationController
  def index
    render inline: "Hello #{current_admin}"
  end
end
