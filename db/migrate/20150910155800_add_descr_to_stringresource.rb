class AddDescrToStringresource < ActiveRecord::Migration
  def change
  	add_column :stringresources, :descr, :string
  end
end
