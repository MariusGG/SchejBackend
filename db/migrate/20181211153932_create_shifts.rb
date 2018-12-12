class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end