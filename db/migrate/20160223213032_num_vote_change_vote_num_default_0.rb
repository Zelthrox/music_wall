class NumVoteChangeVoteNumDefault0 < ActiveRecord::Migration
  def change
    change_table :musics do |t|
      t.remove :num_votes
      t.integer :vote_num, default: 0
    end
  end
end
