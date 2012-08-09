class CreateOldTokenMasters < ActiveRecord::Migration
  def self.up
    create_table :old_token_masters do |t|      
      t.column:sno, :int
      t.column:tokenno, :int
      t.column:token, :char
      t.column:ctypeid, :char
      t.column:serviceid, :char
      t.column:tokendate, :datetime
      t.column:tokentime,:datetime
      t.column:counterno, :int
      t.column:Accno, :int
      t.column:call, :char
      t.column:focus, :char
      t.column:calltime, :datetime
      t.column:calltime2, :datetime
      t.column:visible, :char
      t.column:servicetime,:datetime
      t.column:running,:char
      t.column:skip,:char
      t.column:noofskips,:int
      t.column:completed,:char
      t.column:NonSTPName,:string
      t.column:STPName,:string
      t.column:PauseFlag,:int
      t.column:Pausetime,:datetime
      t.column:Releasetime,:datetime
      t.column:locationid,:int
      t.column:exported, :char
      t.column:exportedON, :datetime
      t.column:userid,:char
      t.column:LSERVER,:char
      t.column:DQMIP,:string
      t.column:DISPLAYVER,:int
      t.column:CSOIP,:string
      t.column:CASHIERVER,:int
      t.column:NoOfCheques,:int

    end
  end

  def self.down
    drop_table :old_token_masters
  end
end
