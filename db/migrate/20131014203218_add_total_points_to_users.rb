class AddTotalPointsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :total_points, :integer

    User.all.each do |user|
      user.total_points = user.karma_points.sum(:value)
      user.save(validate: false)
    end

  end
  def down
    remove_column :users, :total_points
  end
end
