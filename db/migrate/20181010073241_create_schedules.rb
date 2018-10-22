class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.string :city
      t.string :state
      t.string :from_time
      t.string :end_time
      t.integer :user_id
      t.timestamps
    end
  end
end
