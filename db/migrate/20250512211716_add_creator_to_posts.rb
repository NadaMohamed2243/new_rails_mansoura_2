class AddCreatorToPosts < ActiveRecord::Migration[8.0]
  def change
    # First add the column allowing null
    add_reference :posts, :creator, null: true, foreign_key: { to_table: :users }
    
    # Then backfill data (only if needed)
    reversible do |dir|
      dir.up do
        if User.any?
          Post.update_all(creator_id: User.first.id)
        end
      end
    end
    
    # Finally change to not allow null
    change_column_null :posts, :creator_id, false
  end
end
