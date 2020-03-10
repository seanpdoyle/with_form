class WidgetRecordsController < ApplicationController
  def new
    render locals: { widget_record: WidgetRecord.new }
  end

  def create
    widget_record = WidgetRecord.create!(widget_record_params)

    flash.notice = "Created Widget Record: #{widget_record.text_field}"

    redirect_to new_widget_record_url
  end

  def edit
    render locals: { widget_record: WidgetRecord.find(params[:id]) }
  end

  def update
    widget_record = WidgetRecord.find(params[:id])

    widget_record.update!(widget_record_params)

    flash.notice = "Updated Widget Record: #{widget_record.text_field}"

    redirect_to edit_widget_record_url
  end

  private

  def widget_record_params
    params.require(:widget_record).permit!
  end
end
