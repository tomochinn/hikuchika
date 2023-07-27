class Public::CommentsController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    # comment = PostComment.new(post_comment_params)と
    # comment.user_id = current_user.idを合体
    comment = current_user.comments.new(comment_params)
    
    comment.recipe_id = recipe.id
    # コメントを保存
    comment.save
    # レシピ詳細に遷移
    redirect_to recipe_path(recipe)
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
