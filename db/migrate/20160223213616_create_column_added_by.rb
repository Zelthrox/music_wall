class CreateColumnAddedBy < ActiveRecord::Migration
  def change
    change_table :musics do |t|
      t.string :added_by
    end
  end
end
