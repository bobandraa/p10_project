require 'pony'

get '/' do
   erb :index
end

get '/contact' do

  erb :"_contact_form"
end

post '/contact' do
  Pony.mail :to => 'sandra.cohen.ux@gmail.com',
            :subject => params[:email] + " would like to contact you!",
            :from => params[:email],
            :body => params[:content],
            :via => :smtp,
            :via_options => {
              :address    => 'smtp.gmail.com',
              :port       => '587',
              :enable_starttls_auto => true,
              :user_name  => 'devsandraa',
              :password   => 'devbootcamp',
              :authentication => :plain,
              :domain     => "localhost.localdomain"
            }
  redirect '/'
end
