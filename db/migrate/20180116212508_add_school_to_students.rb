class AddSchoolToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :school, index: true
    add_foreign_key :students, :schools
  end
end
