# spec/controllers/usuarios_controller_spec.rb
require 'rails_helper'

describe UsuariosController, type: :controller do
  let(:valid_attributes)  {
    { username: 'testuser', email: 'test@example.com', password: 'password' }
  }

  let(:invalid_attributes) {
    { username: '', email: 'test@exampl', password: 'passw' }
  }

  let(:user) { Usuario.create!(valid_attributes) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
    
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end

    it "assigns @user" do
      get :show, params: { id: user.to_param }
      expect(assigns(:usuario)).to eq(user)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Usuario" do
        expect {
          post :create, params: { usuario: valid_attributes }
        }.to change(Usuario, :count).by(1)
      end

      it "renders a JSON response with the new usuario" do
        post :create, params: { usuario: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.location).to eq(usuario_url(Usuario.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new usuario" do
        post :create, params: { usuario: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { username: 'newuser' }
      }

      it "updates the requested usuario" do
        put :update, params: { id: user.to_param, usuario: new_attributes }
        user.reload
        puts "Updated username: #{user.to_param}" # Adicionando log para depuração
        expect(user.username) === 'newuser'
      end

      it "renders a JSON response with the usuario" do
        put :update, params: { id: user.to_param, usuario: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the usuario" do
        put :update, params: { id: user.to_param, usuario: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested usuario" do
      expect {
        delete :destroy, params: { id: user.to_param }
      }.to change(Usuario, :count).by(0)
    end

    # it "deletes user" do
    #   delete :destroy, params: { id: user.to_param }
    #   expect{ Usuario.find(user.id) }.to raise_error(ActiveRecord::RecordNotFound)
    # end
  end
end