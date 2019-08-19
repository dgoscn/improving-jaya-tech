class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.integer :number
      t.string :github_id

      t.timestamps
    end
  end
end
