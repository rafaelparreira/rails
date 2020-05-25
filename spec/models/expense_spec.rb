require 'rails_helper' 
require 'expense'

RSpec.describe Expense, :type => :model do
    context "Validações" do
        it { is_expected.to validate_presence_of( :description) }
        it { is_expected.to validate_presence_of( :date) }
        it { is_expected.to validate_presence_of( :value) }
        it { is_expected.to validate_presence_of( :picture) }
    end
    context "Presença de campos" do
        subject {
            Expense.new( description: 'Viagem',
            date: Date.today,
            value: 999.99,
            status: 'Pendete',
            picture: File.open(File.join(Rails.root, '/spec/models/files/icone.png')))
        } 
        it "é válido quando decrição, data, valor, comprovate estão presentes" do 
            expect(subject).to be_valid
        end 

        it "é inválido quando o comprovate não esta presentes" do 
            subject.picture = nil
            expect(subject).to_not be_valid
        end

        it "é inválido quando a situação não esta presentes" do 
            subject.status = nil
            expect(subject).to_not be_valid
        end

        it "é inválido quando o valor não esta presentes" do 
            subject.status = nil
            expect(subject).to_not be_valid
        end

        it "é inválido quando a data não esta presentes" do 
            subject.date = nil
            expect(subject).to_not be_valid
        end

        it "é inválido quando a descrição não esta presentes" do 
            subject.description = nil
            expect(subject).to_not be_valid
        end

        it "é inválido quando a valor é zero" do 
            subject.value = 0
            expect(subject).to_not be_valid
        end  
        it "é inválido quando a valor é negativo" do 
            subject.value = -10
            expect(subject).to_not be_valid
        end
       
    end  
end