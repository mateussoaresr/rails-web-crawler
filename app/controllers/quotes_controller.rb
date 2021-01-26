class QuotesController < ApplicationController
  before_action :authorize_request

  def show
    quote_ids = Tag.find_by(name: params[:id])&.quote_ids

    if quote_ids.present?
      @quotes = Quote.find(quote_ids)
    else
      crawler = CrawlerService.new(params[:id])
      @quotes = crawler.perform

      @quotes.each do |quote|
        tags = []
        tags_attributes = []

        quote[:tags].each do |tag|
          stored_tag = Tag.find_by(name: tag)
          if stored_tag.present?
            tags << stored_tag
          else
            tags_attributes << { name: tag }
          end
        end

        params = { title: quote[:quote], author: quote[:author], about: quote[:author_about],
          tags_attributes:  tags_attributes }
        
        create(params, tags)
      end
      show()
    end
    @quotes
  end

  private

  def create(params, tags)
    @quote = Quote.new(params)
    @quote.tags << tags
    @quote.save
  end
end
