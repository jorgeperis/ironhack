class SlipsumController < ApplicationController
  def new
    render 'new'
  end

  def create
    wop = ["Now that there is the Tec-9, a crappy spray gun from South Miami.
    This gun is advertised as the most popular gun in American crime.
    Do you believe that shit? It actually says that in the little book
    that comes with it: the most popular gun in American crime.
    Like they're actually proud of that shit.",
    "Your bones don't break, mine do. That's clear. Your cells react
    to bacteria and viruses differently than mine. You don't get sick,
    I do. That's also clear. But for some reason, you and I react the
    exact same way to water. We swallow it too fast, we choke. We get
    some in our lungs, we drown. However unreal it may seem, we are
    connected, you and I. We're on the same curve, just on opposite ends.",
    "My money's in that office, right? If she start giving me some bullshit
    about it ain't there, and we got to go someplace else and get it, I'm gonna
    shoot you in the head then and there. Then I'm gonna shoot that bitch in
    the kneecaps, find out where my goddamn money is. She gonna tell me too.
    Hey, look at me when I'm talking to you, motherfucker. You listen: we go
    in there, and that nigga Winston or anybody else is in there, you the first
    motherfucker to get shot. You understand?"]
    number = params['wop']['number'].to_i
    if params['wop']['wop'] == 'words'
      words = wop[0].split(" ").each_slice(number).to_a
      @result = words[0]
    else
      @result=[]
      i = 0
      number.times do
        if i <= 2
          @result.push(wop[i])
          i += 1
        else
          i = 0
          @result.push(wop[i])
          i += 1
        end
      end
    end
    render 'create'
  end
end
