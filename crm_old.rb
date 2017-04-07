# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'

# Fake data

  get '/' do
    @crm_app_name = "Mark's CRM"
    erb :index
  end

  get '/contacts' do
    @crm_app_name = "Mark's CRM"
    erb :contacts
  end


  get '/new' do
      @crm_app_name = "Mark's CRM"
    erb :new_contact
  end

  get '/about' do
      @crm_app_name = "Mark's CRM"
    erb :about
  end


  post '/contacts' do
    Contact.create(params)
    redirect to('/contacts')
  end

  get '/contacts/:id' do
    @contact = Contact.find(params[:id].to_i)
    erb :show_contact
  end

  get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
    if @contact
      erb :edit_contact
    else
      raise Sinatra::NotFound
    end
  end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
      erb :show_contact
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end


marty = {'first_name'=>"Marty", 'last_name'=>"McFly",'email'=>"marty@mcfly.com",'note'=>"son"}
Contact.create(marty)
george = {'first_name'=>"George", 'last_name'=>"McFly",'email'=>"george@mcfly.com",'note'=>"dad"}
Contact.create(george)
lorraine = {'first_name'=>"Lorraine", 'last_name'=>"McFly",'email'=>"lorraine@mcfly.com",'note'=>"mom"}
Contact.create(lorraine)
biff = {'first_name'=>"Biff", 'last_name'=>"Tannen",'email'=>"biff@tannen.com",'note'=>"friend"}
Contact.create(biff)
doc = {'first_name'=>"Doc", 'last_name'=>"Brown",'email'=>"doc@brown.com",'note'=>"partner"}
Contact.create(doc)
