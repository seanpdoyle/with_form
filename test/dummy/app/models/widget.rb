class Widget
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :text_field, :string
  attribute :text_area_field, :string
end
