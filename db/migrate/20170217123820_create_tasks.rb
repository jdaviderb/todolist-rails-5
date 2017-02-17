class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
