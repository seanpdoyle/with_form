class AddBooleanCheckBoxFieldToWidgetRecords < ActiveRecord::Migration[5.2]
  def change
    change_table :widget_records do |t|
      t.boolean :boolean_check_box_field
    end
  end
end
