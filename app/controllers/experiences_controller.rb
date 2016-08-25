class ExperiencesController < ApplicationController
    
    def new
        @experience = Expeience.new
    end
    
    def create
        @experience = current_user.Expeiences.build(experiences_params)
        if @experience.save
            flash[:success] = 投稿完了しました。
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end
    
    private
    def experiences_params
        params.require(:experience).permit(:title, :content, :point)
    end
end
