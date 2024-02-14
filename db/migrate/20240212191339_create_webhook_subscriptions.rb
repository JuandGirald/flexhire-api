class CreateWebhookSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :webhook_subscriptions do |t|
      t.string :user_id
      t.string :webhook_id
      t.string :client_mutation_id

      t.timestamps
    end
  end
end
