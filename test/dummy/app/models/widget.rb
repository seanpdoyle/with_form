class Widget
  include ActiveModel::Model
  include ActiveModel::Attributes


  attribute :file_field
  attribute :select_field, :string
  attribute :multiple_select_field, :string
  attribute :text_field, :string
  attribute :text_area_field, :string
end
