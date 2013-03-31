require 'sinatra'
require 'rest-client'
require 'json'
require 'digest/md5'

get '/:email' do
  # File.read(File.join('public', 'index.html'))
  @email = Digest::MD5.hexdigest(params[:email])
  url = "http://biographer.herokuapp.com/api/bio/#{@email}"
  response = RestClient.get(url)
  @bio = JSON.parse(response.body)
  erb :index
end

__END__
@@index
<h1><%= "#{@bio['first_name']} #{@bio['last_name']}" %></h1>
<h1><%= @bio["about_me"] %></h1>
<h1><%= @bio["phone_number"] %></h1>
<h1><%= @bio["occupation"] %></h1>
<h1><%= @bio["school"] %></h1>

