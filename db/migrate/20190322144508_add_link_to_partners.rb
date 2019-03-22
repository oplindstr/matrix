class AddLinkToPartners < ActiveRecord::Migration
  def change
  	add_column :partners, :link, :string
  end
end
