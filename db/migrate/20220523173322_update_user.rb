class UpdateUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :surname, null: false, default: ''
      t.string :phone_number, default: ''
      t.string :about, default: ''
    end
  end
end
