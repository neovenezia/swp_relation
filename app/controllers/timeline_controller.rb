class TimelineController < ApplicationController 
    before_action :authenticate_user!, except: :index
    def index
        @blogs = Blog.all.reverse
    end
    
    def page
        @page = Blog.where(user_id: params[:id])
    end
    
    def write
        Blog.create(user_id: current_user.id, content: params[:naeyong])
        redirect_to :root
    end
    
    def comment 
        Comment.create(user_id: current_user.id, blog_id: params[:blog_id], msg: params[:comment])
        redirect_to :root
    end
    
    def destroy
        dd = Blog.find(params[:id])
        dd.destroy
        redirect_to :root
    end
    
    def edit
        @blog = Blog.find(params[:id])
    end
    
    def update
        pp = Blog.find(params[:id])
        pp.content = params[:naeyong]
        pp.save
        redirect_to :root
    end
    
    def comment_destroy
        cd = Comment.find(params[:id])
        cd.destroy
        redirect_to :root
    end
    
    def comment_edit
        @comment = Comment.find(params[:id])
    end    
    
    
    def comment_update
        cu = Comment.find(params[:id])
        cu.msg = params[:comment]
        cu.save
        redirect_to :root
    end
end

