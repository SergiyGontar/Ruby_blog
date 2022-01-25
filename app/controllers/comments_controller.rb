 class CommentsController < ApplicationController
 	# check for autintification
 	#http_basic_authenticate_with name:"admin", password:"1qw2"

 	def create
 		 @post = Post.find(params[:post_id])
 		 @comment = @post.comments.create(comment_params)
 		 redirect_to posts_path
 	end

 private def comment_params
	 		params.require(:comment).permit(:username, :body)
	 	end
end
