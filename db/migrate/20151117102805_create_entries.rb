class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :project, index: true #allways reference to her id 'project_id'
      t.integer    :hours
      t.integer    :minutes
      t.text       :comment
      t.datetime   :date

      t.timestamps null: false #not permit to save null
    end
  end
end
