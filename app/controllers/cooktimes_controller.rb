class CooktimesController < ApplicationController

    def edit
        @cooktime = Cooktime.all
    end

    def update
        params[:id].zip(params[:time]).each do |id, time|
            @time = Cooktime.find(id)
            @time.time = time

            binding.pry
            @time.save
        end
        redirect_to("/")
    end
end
