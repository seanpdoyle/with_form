class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.references :tag, null: false, foreign_key: true, index: true
      t.references :widget_record, null: false, foreign_key: true, index: true
    end
  end
end
