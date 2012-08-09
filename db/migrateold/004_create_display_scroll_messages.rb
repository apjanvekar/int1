class CreateDisplayScrollMessages < ActiveRecord::Migration
  def self.up
    create_table :display_scroll_messages do |t|
      t.column:SCRL_DisplayScrollMessageID, :int
      t.column:SCRL_DisplayScrollMessage, :string
      t.column:created_at, :datetime
      t.column:SCRL_CreatedBy, :int
      t.column:updated_at, :datetime
      t.column:SCRL_LastModifiedBy, :int
    end
  end

  def self.down
    drop_table :display_scroll_messages
  end
end
