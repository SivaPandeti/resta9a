class AddPasswordToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :password, :string
    add_column :customers, :secret_question, :string
    add_column :customers, :secret_answer, :string
    add_column :customers, :default_credit_card_no, :string
  end
end
