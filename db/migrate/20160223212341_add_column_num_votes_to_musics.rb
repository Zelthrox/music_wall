class AddColumnNumVotesToMusics < ActiveRecord::Migration
  def change
    change_table :musics do |t|
      t.integer :num_votes
    end
  end
end
