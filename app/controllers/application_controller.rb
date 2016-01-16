class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  #Active Record Throws page not found for wrong or not existing lings
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", formats: [:html], status: 403, layout: true}
    end
  end
  #CanCan authorization page not found for unauthorized users
  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end
end
