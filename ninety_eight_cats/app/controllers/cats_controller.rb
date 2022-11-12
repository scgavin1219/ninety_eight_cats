class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end



    private
    def cat_params
        params.require(:cats).permit(:name, :sex, :age, :description, :color)
    end

end