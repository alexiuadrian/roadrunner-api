class CreateRuns < ActiveRecord::Migration[6.1]
  def change
    create_table :runs do |t|
      t.datetime :date
      t.integer :distance
      t.time :time
      t.float :average_speed

      t.timestamps
    end
  end
end
