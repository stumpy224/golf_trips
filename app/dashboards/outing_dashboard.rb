require "administrate/base_dashboard"

class OutingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
      course: Field::BelongsTo,
      outing_golfers: Field::HasMany.with_options(
          limit: 100
      ),
      id: Field::Number,
      name: Field::String,
      start_date: DateField,
      end_date: DateField,
      created_at: Field::DateTime,
      updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
      :course,
      :name,
      :start_date,
      :end_date,
      :outing_golfers,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
      :course,
      :name,
      :start_date,
      :end_date,
      :created_at,
      :updated_at,
      :outing_golfers
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
      :course,
      :name,
      :start_date,
      :end_date,
  ].freeze

  # Overwrite this method to customize how outings are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(outing)
    "#{outing.name} Outing"
  end
end
