class PostsController < ApplicationController
	# only for autintificated users
	http_basic_authenticate_with name:"admin", password:"1qw2",
		except: [:index, :show]


	def index
		# will show all the posts from db on our main page
		@post = Post.all
	end

	def new
		@post = Post.new
	end

	def show  # will show our article using post :id
		@post = Post.find(params[:id])
	end

	def edit  # will show our article using post :id
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if(@post.update(post_params))  # save post into db
			redirect_to @post # redirect to def "show" with post params
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])

		@post.destroy
		redirect_to posts_path
		#@post = Post.all
	end

	def create
		#render plain: params[:post].inspect
		@post = Post.new(post_params)  # use private def function named post_params

		if(@post.save)  # save post into db
			redirect_to @post # redirect to def "show" with post params
		else
			render 'new'
		end
		
	end

	private 
		def post_params  # print those params, wich should insert into db
			params.require(:post).permit(:title, :body)
		end
end
