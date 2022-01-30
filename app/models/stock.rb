class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new( publishable_token: Rails.application.credentials.iex[:publishable_key], endpoint: "https://sandbox.iexapis.com/v1")
    begin
      quote = client.quote(ticker_symbol)
      new(ticker: quote.symbol, name: quote.company_name, last_price: quote.latest_price)
    rescue
      return nil
    end
  end
end
