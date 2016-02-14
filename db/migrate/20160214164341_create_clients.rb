class CreateClients < ActiveRecord::Migration
  def change
    create_table :client do |t|
      t.text :name
      t.rext :phone
      t.text :datestamp
      t.text :barber
      t.text :color

      t.timestamps
    end
  end
end
