class CreateVacations < ActiveRecord::Migration[5.1]
  def change
    create_table :vacations do |t|
      t.belongs_to :user
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
