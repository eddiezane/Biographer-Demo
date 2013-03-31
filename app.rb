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
<%= "#{@bio['first_name']} #{@bio['last_name']}" %>
<br>
<%= @bio["about_me"] %>
<br>
<%= @bio["phone_number"] %>
<br>
<%= @bio["occupation"] %>
<br>
<%= @bio["school"] %>

