class AddDaysToVacation < ActiveRecord::Migration[5.1]
  def change
    add_column :vacations, :days, :integer, limit: 2
  end
end
