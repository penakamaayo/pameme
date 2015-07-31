require 'sinatra'
require 'json'
require 'giphy'

get '/' do
  'Pamemeeehhhh..'
end

post '/' do
  content_type :json

  if params_present? && meme
    parse_url random_gif.original_image.url
  else
    parse_msg 'Walang ganun. sarree - :james:'
  end
end





def params_present?
  params.has_key?('text') && params.has_key?('trigger_word')
end


def parse_url url
  {:text => url}.to_json
end


def meme
  @pameme ||= Giphy.search(params[:text]).sample
end


def search_term
  params[:text].gsub(params[:trigger_word], '').strip
end

