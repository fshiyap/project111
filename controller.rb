require 'sinatra'

require_relative './database.rb'

get '/' do
    redirect to '/students'
end

get '/students' do
   db = DBHandler.new
    @students1 =db.grad
    @students2=db.notgrad
    erb :application do
        erb :index
    end
end

get '/students/new' do
   erb :application do
       erb :new
   end
end

post '/students' do
   db = DBHandler.new
   db.create(params[:newstudent], params[:fname], params[:major], params[:email], params[:status])
   redirect to '/students'
end

get '/students/:lname' do
   lname = params[:lname]
   db = DBHandler.new
   @student = db.get(lname)
   erb :application do
      erb :show 
   end
end

get '/students/:lname/edit' do
    lname = params[:lname]
    db = DBHandler.new
    @student = db.get(lname)
   erb :application do
      erb :edit 
   end
end

patch '/students/:lname' do
  lname = params[:lname]
  db = DBHandler.new
  db.delete(lname)
  db.create(params[:newstudent], params[:fname], params[:major], params[:email], params[:status])
  redirect to '/students'
end

get '/students/:lname/delete' do
   lname = params[:lname]
   db = DBHandler.new
   db.delete(lname)
   redirect to '/students'
end

