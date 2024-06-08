class CreateUsuarios < ActiveRecord::Migration[7.1]
  def change
    create_table :usuarios do |t|
      t.string :username
      t.string :email
      t.string :password_digest  # Deve ser password_digest para bcrypt

      t.timestamps
    end
  end
end
