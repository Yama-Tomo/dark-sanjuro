class ChangeTransLost < ActiveRecord::Migration
  def up
    change_column :media_converters, :trans_lost_from, :float
    change_column :media_converters, :trans_lost_to,   :float
  end

  def down
    change_column :media_converters, :trans_lost_from, :int
    change_column :media_converters, :trans_lost_to,   :int
  end
end
