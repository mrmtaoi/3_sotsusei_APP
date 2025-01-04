class CreateEmergencyKits < ActiveRecord::Migration[7.0]
  belongs_to :emergency_kit
  belongs_to :item
  has_many :reminders, dependent: :destroy
  
  def change
    create_table :emergency_kits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: :emergency_kits_owners }
      t.text :body
      t.string :storage
      t.timestamps
    end
  end
end
