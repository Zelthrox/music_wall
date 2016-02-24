class CreateVoteScoreSystem < ActiveRecord::Migration
  def change
    create_table :vote do |t|
      t.string :voter
      t.integer :score
    end
    
    change_table :musics do |t|
      t.remove :vote_num
    end
  end
end
