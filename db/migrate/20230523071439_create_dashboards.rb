class CreateDashboards < ActiveRecord::Migration[7.0]
  def change
    create_table :dashboards do |t|

      t.timestamps
    end
  end
end
