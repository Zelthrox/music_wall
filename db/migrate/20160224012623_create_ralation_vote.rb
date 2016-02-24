class CreateRalationVote < ActiveRecord::Migration

  def change

    rename_table :vote, :votes

    change_table :votes do |t|
      t.references :user
      t.references :music
    end
  end
end
