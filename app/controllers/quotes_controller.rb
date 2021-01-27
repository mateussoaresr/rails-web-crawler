class QuotesController < ApplicationController
  before_action :authorize_request

  def show
    quote_ids = Tag.find_by(name: params[:id])&.quote_ids

    if quote_ids.present?
      @quotes = Quote.find(quote_ids)
    else
      crawler = CrawlerService.new(params[:id])
      @quotes = crawler.perform

      if @quotes.present?
        @quotes.each do |quote|
          author = {}
          author_attributes = {}
          tags = []
          tags_attributes = []

          stored_author = Author.find_by(name: quote[:author])

          if stored_author.present?
            author = stored_author
          else
            author_attributes = {name: quote[:author], author_about: quote[:author_about]}
          end

          quote[:tags].each do |tag|
            stored_tag = Tag.find_by(name: tag)
            if stored_tag.present?
              tags << stored_tag
            else
              tags_attributes << {name: tag}
            end
          end

          params = {title: quote[:quote], tags_attributes: tags_attributes,
                    author_attributes: author_attributes}

          create(params, tags, author)
        end
        show
      else
        render json: {error: "Tag não encontrada"}
      end
    end
    @quotes
  end

  def create(params, tags, author)
    @quote = Quote.new(params)
    @quote.tags << tags
    @quote.author = author if author.present?
    @quote.save!
  end
end
