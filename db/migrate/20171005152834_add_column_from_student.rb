lass AddColumnFromStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :genesis_id, :int
  end
end
