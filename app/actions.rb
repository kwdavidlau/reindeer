# Homepage (Root path)
get '/' do
  erb :index
end


get '/reindeer' do
  @reindeers = Reindeer.all
  erb :'/reindeer/index'
end

post '/reindeer' do
  @reindeer = Reindeer.new(
    name: params[:name],
    email: params[:email],
    mobile: params[:mobile]
  )
  @reindeer.save
  redirect :'/reindeer'
end

# -------------

get '/gifts' do
  @gifts = Gift.all
  erb :'/gifts/index'
end

post '/gifts' do
  @gift = Gift.new(
    name_of_gift: params[:gift],
    gift_value: params[:gift_value]
  )
  @gift.save
  redirect :'/gifts'
end

# ------------

get '/child' do
  @children = Child.all
  erb:'child/index'
end

post '/child' do
  @child = Child.new(
    name: params[:name],
    age: params[:age],
    address: params[:address],
    received: false
  )
  @child.save
  redirect :'/child'
end

# ------------

get '/deliver' do
  @children = Child.all
  erb :'/deliver/index'
end
