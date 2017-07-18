class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.column :author, :string
      t.column :content, :string
      t.column :rating, :integer
      t.column :city, :string

      t.timestamp
    end
  end
end
