class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table(:users) do |t|
      t.change :email, :string
    end

    add_index :users, :email, unique: true
  end
end
