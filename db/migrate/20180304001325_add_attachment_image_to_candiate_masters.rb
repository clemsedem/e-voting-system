class AddAttachmentImageToCandiateMasters < ActiveRecord::Migration
  def self.up
    change_table :candidate_masters do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :candidate_masters, :image
  end
end
