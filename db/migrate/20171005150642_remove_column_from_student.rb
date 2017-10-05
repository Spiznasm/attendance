class RemoveColumnFromStudent < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :genesis_id, :string
  end
end
