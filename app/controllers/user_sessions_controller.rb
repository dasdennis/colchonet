class UserSessionsController < ApplicationController
  def new
    @session = UserSession.new(session)
  end

  def create
    @session = UserSession.new(session, params[:user_session])
    if @session.authenticate!
      redirect_to root_path, :notice => t('flash.notice.signed_in')
    else
      render action: :new
    end
  end

  def destroy

  end
end