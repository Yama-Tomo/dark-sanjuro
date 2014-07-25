class AddMediaConvertersTo4columns < ActiveRecord::Migration
  def change
    add_column :media_converters, :manufacturer, :string
    add_column :media_converters, :price,        :integer
    add_column :media_converters, :buying_price, :integer
    add_column :media_converters, :sale_price,   :integer
    add_column :media_converters, :desc,         :string
  end
end
