class CreateDatasets < ActiveRecord::Migration[5.1]
  def change
    create_table :datasets do |t|
      t.references :business, foreign_key: true
      t.string :data

      t.timestamps
    end
  end
end
