class AddImageFieldsToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :image1_file_name, :string
    add_column :reviews, :image1_content_type, :string
    add_column :reviews, :image1_file_size, :integer
    add_column :reviews, :image1_updated_at, :datetime

    add_column :reviews, :image2_file_name, :string
    add_column :reviews, :image2_content_type, :string
    add_column :reviews, :image2_file_size, :integer
    add_column :reviews, :image2_updated_at, :datetime

    add_column :reviews, :image3_file_name, :string
    add_column :reviews, :image3_content_type, :string
    add_column :reviews, :image3_file_size, :integer
    add_column :reviews, :image3_updated_at, :datetime
  end
end
