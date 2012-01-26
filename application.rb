%w( rubygems sinatra haml sass gravatar-ultimate ).each do |dependency|
	require dependency
end

helpers do
  
  def link_to_unless_current(title, url)
    if url == request.path
      title
    else
      "<a href=\"#{url}\" title=\"#{title}\">#{title}</a>"
    end
  end
  
end

# Styles
get "/stylesheets/styles.css" do
  headers 'Content-Type' => 'text/css; :charset=utf-8'
  response['Expires'] = (Time.now + 60*60*24*356*3).httpdate
  sass :styles
end

get "/stylesheets/print.css" do
  headers 'Content-Type' => 'text/css; :charset=utf-8'
  response['Expires'] = (Time.now + 60*60*24*356*3).httpdate
  sass :print
end

# GET
get "/" do
  haml :resume
end
# 
# get "/work" do
#   haml :work
# end
# 
# get "/case-study" do
#   haml :case_study
# end