class MeetupsController < ApplicationController
  def show; end

  def search
    TriggerSearchJob.perform_later(query: params[:query])
    flash[:notice] = I18n.t("meetups.search.success.message")
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  def polling
    results = TriggerSearch.new.find(params[:query])
    render json: results
  end
end
