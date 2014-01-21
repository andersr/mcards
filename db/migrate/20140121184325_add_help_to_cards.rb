class AddHelpToCards < ActiveRecord::Migration
  def change
    add_column :cards, :help, :string
  end
end
