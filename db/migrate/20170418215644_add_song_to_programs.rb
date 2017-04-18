class AddSongToPrograms < ActiveRecord::Migration
  #actually it adds program_id column to songs table
  def change
    add_reference :songs, :program, index: true, foreign_key: true
  end
end
