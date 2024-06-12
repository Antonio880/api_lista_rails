require 'rails_helper'

RSpec.describe Usuario, type: :model do
  context 'associations' do
    #Shoulda matchers
    # it { should validate_presence_of(:username) }
    # it { should have_secure_password }
    let(:usuario) { create(:usuario) }

    it 'has_many tarefas' do
      #  user = Usuario.create(username: 'testuser', email: 't@gmail.com', password: 'password')
       tarefa = Tarefa.create(titulo: "tarefa", usuario_id: usuario.id)
       expect(usuario.tarefas).to include(tarefa)
       expect(Usuario.reflect_on_association(:tarefas)).to_not be_nil
    end

    context 'instance methods' do 
      it 'name_and_email' do
        #Ajuda na questão de datas no formato americano
        before do
          Timecop.freeze("01/01/2024".to_date)
        end
  
  
        after do
          Timecop.return
        end
  
        expect(usuario.name_and_email).to eq("#{usuario.username} - #{usuario.email} - 2024-01-01")
      end
    end
  end
end
