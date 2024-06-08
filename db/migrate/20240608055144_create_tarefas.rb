class CreateTarefas < ActiveRecord::Migration[7.1]
  def change
    create_table :tarefas do |t|
      t.string :titulo
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
