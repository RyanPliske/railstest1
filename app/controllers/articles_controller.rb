class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		' params Array contains parameters (KVP) from URL : Key = plain, value = params[:article]'
		' params[:article] = "whatever" for http://www.example.com/?article=whatever'
		' render plain: params[:article].inspect '
		' Save parameters to Article Model. (classnames begin with capital letter)'
		@article = Article.new(article_params)

		if @article.save
			' http://api.rubyonrails.org/classes/ActionController/Redirecting.html'
			' rails passes instance variables to the view (instance var @)'
			redirect_to @article
		else
			' @article object is passed back to the new template when its rendered.'
			' This rendering is done on the same request as form submission. VS redirect_to tells 
				the browser to issue another request '
			render 'new'
		end
	end

	' private method to Whitelist controller parameters to prevent wrongful assignment in model'
	private
		def article_params
			params.require(:article).permit(:title,:text)
		end
end
