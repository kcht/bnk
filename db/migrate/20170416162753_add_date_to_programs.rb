class AddDateToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :airing_date, :date
  end
end
