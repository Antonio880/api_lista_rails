require "rails_helper"

RSpec.describe(Usuarios::Organizers::Search) do
  describe ".call" do
    # database_cleaner
    Usuario.delete_all

    # setup
    Usuario.create!(username: "Jackson Pires", email: "jackson.pires@jack.com", password: "teste123")
    Usuario.create!(username: "Joao da Silva", email: "joaosilva@joao.com", password: "teste1234")

    context "when success" do

  
        it "returns all users when term is empty" do
          allow(Rails.logger).to receive(:info).at_least(:once)
  
          result = described_class.call(term: "", usuario: "Jackson Pires")
  
          expect(Rails.logger).to(have_received(:info).with("[INFO] A new search was made by 'Jackson Pires' with term ''",))
  
          expect(result.success?).to(be(true))
          expect(result.usuarios.size).to(eq(2))
          expect(result.usuarios.map { _1.username }).to(match_array(["Jackson Pires", "Joao da Silva"]))
        end
      end
    end
  end
  