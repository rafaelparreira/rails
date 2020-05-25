require 'rails_helper' 
require 'manager'

RSpec.describe Manager, :type => :model do
    subject {
            Manager.new(
            name: 'Rafael',
            email: 'test@example.com', 
            password: 'password123',
            password_confirmation: 'password123'
            )
    }
    it 'é válido quando nome, email, senha e confirmação de senha estão presentes' do 
        expect(subject).to be_valid
    end
    it 'não é válido quando o nome não estão presentes' do 
        subject.name = nil
        expect(subject).to_not be_valid
    end 
    it 'não é válido quando o email não estão presentes' do  
        subject.email = nil
        expect(subject).to_not be_valid
    end 
    it 'não é válido quando a senha não estão presentes' do  
        subject.password = nil
        expect(subject).to_not be_valid
    end 
    it 'não é válido quando a confirmação da senha não estão presentes' do 
        subject.password_confirmation = nil
        expect(subject).to_not be_valid
    end 
    it 'é válido quando o email é unico' do 
        manager2 = Manager.new(
            name: 'Rafael',
            email: 'test2@example.com', 
            password: 'password123',
            password_confirmation: 'password123'
            )
        expect(subject).to be_valid
    end
    it 'é válido quando o email não é unico' do 
        manager2 = Manager.new(
            name: 'Rafael',
            email: 'test@example.com', 
            password: 'password123',
            password_confirmation: 'password123'
            )
        expect(subject).to be_valid
    end
end