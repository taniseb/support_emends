class AddNameAndDescriptionToEmmends < ActiveRecord::Migration[6.0]
  def change
    add_column :emmends, :name, :string
    add_column :emmends, :description, :text
  end
end
