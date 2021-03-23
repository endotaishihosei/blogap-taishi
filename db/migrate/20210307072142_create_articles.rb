class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :content, null: false
      # ActiveRecord側にvalidatesを記述するだけでは心配なのでSQL自体に制限を記述
      t.timestamps
    end
  end
end
