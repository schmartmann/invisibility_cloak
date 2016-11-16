class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :translations, :display, :boolean
  end
end
