class AddKeys < ActiveRecord::Migration
  def up
    add_foreign_key "objects", "users", name: "objects_userid_fk", column: "userid", dependent: :delete
  end

  def down
    remove_foreign_key "objects", name: "objects_userid_fk"
  end
end
