class MeetupsController < ApplicationController
  def show; end

  def search
    TriggerSearchJob.perform_later(query: params[:query])
    flash[:notice] = "Request is being processed and results will be available shortly"
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end
end
