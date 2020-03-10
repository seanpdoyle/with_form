class Widget
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :checkbox_field
  attribute :single_checkbox_field
  attribute :checked_single_checkbox_field
  attribute :file_field
  attribute :select_field, :string
  attribute :multiple_select_field, :string
  attribute :radio_field, :string
  attribute :text_field, :string
  attribute :text_area_field, :string
end
