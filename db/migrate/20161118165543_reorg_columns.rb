class ReorgColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :translations, :display
  end
end
