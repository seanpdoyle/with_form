class CreateWidgetRecords < ActiveRecord::Migration[Rails.version.to_f]
  def change
    create_table :widget_records do |t|
      t.text :text_field
    end
  end
end
