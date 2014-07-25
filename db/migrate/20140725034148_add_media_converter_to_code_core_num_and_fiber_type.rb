class AddMediaConverterToCodeCoreNumAndFiberType < ActiveRecord::Migration
  def change
    add_column :media_converters, :code_core_num, :string
    add_column :media_converters, :fiber_type, :string
  end
end
