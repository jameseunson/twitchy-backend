class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :code
      t.datetime :expires

      t.timestamps null: false
    end
  end
end
