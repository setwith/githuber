class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :git_login
      t.string :git_name

      t.timestamps
    end
  end
end
