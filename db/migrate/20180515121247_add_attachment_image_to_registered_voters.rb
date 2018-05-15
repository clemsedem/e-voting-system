class AddAttachmentImageToRegisteredVoters < ActiveRecord::Migration
  def self.up
    change_table :registered_voters do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :registered_voters, :image
  end
end
