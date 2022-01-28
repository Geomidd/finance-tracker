class StocksController < ApplicationController
  respond_to :js

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render partial: "users/stock"
      else
        error = "Please enter a valid symbol to search"
        render partial: "users/stock_error", locals: {error: error}
      end
    else
      error = "Please enter a symbol to search"
      render partial: "users/stock_error", locals: {error: error}
    end
  end
end