# Homepage (Root path)
get '/' do
  erb :index
end

get '/elves' do
  erb:'/elves/index'
end

post '/children' do
  @child = Child.new(
    name: params[:name],
    age: params[:age],
    address: params[:address],
    received: false
  )
  @child.save
  redirect :'/elves/index'
end

post '/reindeer' do
  @reindeer = Reindeer.new(
    name: params[:name],
    email: params[:email],
    mobile: params[:mobile]
  )
  @reindeer.save
  redirect :'/elves/index'
end

post '/gifts' do
  @delivery = Delivery.new
  @gift = Gift.new(
    name_of_gift: params[:gift],
    gift_value: params[:gift_value]
  )
  @gift.save
  @delivery.gift = @gift
  @delivery.save
  redirect :'/elves/index'
end

# elves/show to show all the children, reindeer, and gifts ---------


get '/show' do
  @gifts = Gift.all
  @deliveries = Delivery.all
  @reindeers = Reindeer.all
  @children = Child.all

  #assigning the gifts to children
  @children.each do |child|
    @gifts.each do |gift|
      gift.child = child if (child.gift_id.nil? && gift.child.nil?)
    end
  end

  #assigning the reindeer to gifts
  @deliveries.each do |delivery|
    @reindeers.each do |reindeer|
      reindeer.delivery = delivery
    end
  end



  erb :'/elves/show'
end

# Reindeer page showing their deliveries`-------------

get '/reindeer' do
  @deliveries = Delivery.all
  @gifts = Gift.all
  erb :'reindeer/index'
end

# Children page showing the status of their delivery------------

get '/children' do
  @children = Child.all
  erb :'/children/index'
end

# ------------
