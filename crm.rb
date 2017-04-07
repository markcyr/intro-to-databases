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
    contact = Contact.create(
      first_name: params[:first_name],
      last_name:  params[:last_name],
      email:      params[:email],
      note:       params[:note]
    )
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
      @contact.update_attribute(:first_name, params[:first_name])
      @contact.update_attribute(:last_name, params[:last_name])
      @contact.update_attribute(:email, params[:email])
      @contact.update_attribute(:note, params[:note])
      redirect to ('/')
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
