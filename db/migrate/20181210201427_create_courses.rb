class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :url

      t.timestamps
    end
  end
end
