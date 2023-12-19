class UtilsController < ApplicationController
    
    def seed_database
        result = Utils::Organizers::Seed.call(secret: params[:secret])
        
        if result.success?
            render json: {message: "Banco de dados semeado!"}
        else
            render json: {message: "Erro ao semear banco de dados!"}
        end
    end
  end