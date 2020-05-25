require 'rails_helper'
require 'expense'
require 'devise'

describe ExpensesController do
    let!(:user) do
        Manager.new(
            name: 'Rafael',
            email: 'test2@example.com', 
            password: 'password123',
            password_confirmation: 'password123'
        )
    end
    
    let(:fun) do
        Employee.new(
            name: 'Rafael',
            email: 'test2@example.com', 
            password: 'password123',
            password_confirmation: 'password123'
        )
    end
    let(:expense) do
        Expense.new( description: 'Viagem',
            date: Date.today,
            value: 999.99,
            status: 'Pendete',
            picture: File.open(File.join(Rails.root, '/spec/models/files/icone.png'))
        )
    end 

    before {
        employee_session_path(fun)
    }
    it "Get index" do
        get :index
        expect(response.status).to eq(200)
    end    
end