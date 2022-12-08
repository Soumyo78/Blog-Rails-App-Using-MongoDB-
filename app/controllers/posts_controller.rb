class PostsController < ApplicationController
  def index
    posts = Post.order(created_at: :desc).page(params[:page]).includes([:user])
    render_success(:ok, posts, include: [:user], meta: { message: "Posts loaded." })
  end

  def create
    post = Post.new(post_params)

    if post.save
      render_success(:created, post, include: [:user], meta: { message: "Post created." })
    else
      render_error(422, post.errors, message: "Failed to create post.")
    end
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :user_id, post_attachment_files: [])
    end
end
