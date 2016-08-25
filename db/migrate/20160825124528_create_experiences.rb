class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :content
      t.integer :point

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
