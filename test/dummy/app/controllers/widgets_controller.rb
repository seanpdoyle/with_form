class WidgetsController < ApplicationController
  def new
    flash.notice = params[:commit]
  end
end
