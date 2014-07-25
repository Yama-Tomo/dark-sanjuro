class CreateMediaConverters < ActiveRecord::Migration
  def change
    create_table :media_converters do |t|
      t.string :name
      t.integer :trans_lost_from
      t.integer :trans_lost_to
      t.integer :bandwidth

      t.timestamps
    end
  end
end
