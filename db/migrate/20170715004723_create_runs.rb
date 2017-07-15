class CreateRuns < ActiveRecord::Migration
  def change
  	create_table :runs do |t|
  		t.string :location
  		t.string :date
  		t.decimal :distance
  		t.integer :runner_id
  	end
  end
end
