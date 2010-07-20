%w( rubygems sinatra haml sass gravatar-ultimate ).each do |dependency|
	require dependency
end

helpers do
end

# Styles
get "/stylesheets/styles.css" do
  headers 'Content-Type' => 'text/css; :charset=utf-8'
	response['Expires'] = (Time.now + 60*60*24*356*3).httpdate
  sass :styles
end

# GET
get "/" do
  haml :resume
end

get "/work" do
  haml :work
end