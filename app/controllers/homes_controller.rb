class HomesController < ApplicationController
    http_basic_authenticate_with name: "akshay", password: "akshara"

    def index
    end    
end
