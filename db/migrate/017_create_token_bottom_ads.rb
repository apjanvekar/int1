class CreateTokenBottomAds < ActiveRecord::Migration
  def self.up
    create_table :token_bottom_ads do |t|
      t.column:BOT_TokenBottomAdID,:int
      t.column:BOT_AdMessage,:string
      t.column:created_at,:datetime	
      t.column:BOT_CreatedBy,:int	
      t.column:updated_at,:datetime	
      t.column:BOT_LastModifiedBy,:int
    end
  end

  def self.down
    drop_table :token_bottom_ads
  end
end
