class CreateWidgetRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :widget_records do |t|
      t.text :text_field
    end
  end
end
