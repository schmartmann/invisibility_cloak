class ConvertTypeColumnToCategoryTwo < ActiveRecord::Migration[5.0]
  def change
    rename_column :translations, :type, :category
  end
end
