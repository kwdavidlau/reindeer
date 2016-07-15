# Homepage (Root path)
# ------ show pages
# -----------------------

get '/' do
    erb :index
end

get '/elves' do
    erb:'/elves/index'
end

# Reindeer page showing their deliveries`-------------

get '/reindeer' do
    @deliveries = Delivery.all
    @reindeers = Reindeer.all
    erb :'reindeer/index'
end

# Children page showing the status of their delivery------------

get '/children' do
    @children = Child.all
    erb :'/children/index'
end

#----- get information
# -------------------

post '/children' do
    @child = Child.new(
        name: params[:name],
        age: params[:age],
        address: params[:address],
        received: false
    )
    @child.save
    redirect :'/elves'
end

post '/reindeer' do
    @reindeer = Reindeer.new(
        name: params[:name],
        email: params[:email],
        mobile: params[:mobile]
    )
    @reindeer.save
    redirect :'/elves'
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
    redirect :'/elves'
end

# elves/show to show all the children, reindeer, and gifts ---------

get '/elves/show' do
    @gifts = Gift.all
    @unassigned_deliveries = Delivery.where(reindeer_id: nil)
    @reindeers = Reindeer.all
    @children = Child.all

    # assigning the gifts to children
    @children.each do |child|
        @gifts.each do |gift|
            # binding.pry
            gift.child = child if child.gift_id.nil? && gift.child.nil?
        end
    end

    # assigning the reindeer to gifts
    reindeer_enum = @reindeers.cycle

    @unassigned_deliveries.each do |delivery|
        reindeer_enum.next.deliveries << delivery unless Reindeer.all.empty?
    end
    erb :'/elves/show'
end

post '/deliveries' do
    d = Delivery.find(params[:id])
    if params.key?('delivered')
        d.delivery_status = params[:delivered] == "on" ? true : false
    else
        d.time_to_deliver = params[:date]
    end
    d.save
    redirect :'/reindeer'
end
