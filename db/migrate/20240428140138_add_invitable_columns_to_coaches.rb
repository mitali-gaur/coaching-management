class AddInvitableColumnsToCoaches < ActiveRecord::Migration[7.0]
  def change
    add_column :coaches, :invitation_token, :string
    add_column :coaches, :invitation_created_at, :datetime
    add_column :coaches, :invitation_sent_at, :datetime
    add_column :coaches, :invitation_accepted_at, :datetime
    add_column :coaches, :invitation_limit, :integer
    add_column :coaches, :invited_by_id, :integer
    add_column :coaches, :invited_by_type, :string
    add_index :coaches, :invitation_token, unique: true

    add_column :coaches, :confirmation_token, :string
    add_column :coaches, :confirmed_at, :datetime
    add_column :coaches, :confirmation_sent_at, :datetime
    add_column :coaches, :unconfirmed_email, :string
    add_index :coaches, :confirmation_token, unique: true
  end
end
