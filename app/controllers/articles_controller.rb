class ArticlesController < ApplicationController
	def new

	end

	def show
		@article = Article.find(params[:id])
		redirect_to @article
	end

	def create
		' params Array contains parameters (KVP) from URL : Key = plain, value = params[:article]'
		' params[:article] = "whatever" for http://www.example.com/?article=whatever'
		' render plain: params[:article].inspect '
		'Save parameters to Article Model. (classnames begin with capital letter)'
		@article = Article.new(article_params)
		@article.save
		' http://api.rubyonrails.org/classes/ActionController/Redirecting.html'
		' rails passes instance variables to the view (instance var @)'
		redirect_to @article
	end

	def index
		@articles = Article.all
	end

	' private method to Whitelist controller parameters to prevent wrongful assignment in model'
	private
		def article_params
			params.require(:article).permit(:title,:text)
		end
end
