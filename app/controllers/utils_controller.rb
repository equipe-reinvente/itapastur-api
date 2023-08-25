class UtilsController < ApplicationController
    SECRET = "#K99@t3CO7Kn"
  
    def seed_database
        if params[:secret] == SECRET
            Category.create(name: "Loja")
            Category.create(name: "Ponto Turístico")
            Category.create(name: "Artesão")
        end
    end
  end