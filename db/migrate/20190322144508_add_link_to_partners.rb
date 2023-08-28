class AddLinkToPartners < ActiveRecord::Migration[7.0]
  def change
  	add_column :partners, :link, :string
  end
end
