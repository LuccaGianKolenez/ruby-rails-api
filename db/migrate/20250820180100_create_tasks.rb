class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.boolean :done, default: false
      t.timestamps
    end
  end
end
