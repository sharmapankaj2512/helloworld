require_relative "../helloworld.rb"

describe Helloworld do
  it "displays a name." do
    # helloworld = Helloworld.new
    # expect()
  end

  context '#west_of' do
    it "shows location is west of another" do
      helloworld = Helloworld.new
      helloworld.say_hello("@alterisian", "Málaga, Spain")
      helloworld.say_hello("@bsilva96", "Machalí, Chile")    

      expect( helloworld.west_of("@alterisian") ).to eq(["@bsilva96, Machalí, Chile"])
    end

    it 'returns three people west of a given person' do
      helloworld = Helloworld.new
      helloworld.say_hello("@theOnlyMaDDogx", "New Delhi, India")
      helloworld.say_hello("@alterisian", "Málaga, Spain")
      helloworld.say_hello("@bsilva96", "Machalí, Chile")
      helloworld.say_hello("@lucianghinda", "Bucharest, Romania")

      expect( helloworld.west_of("@theOnlyMaDDogx") ).to eq(["@alterisian, Málaga, Spain", "@bsilva96, Machalí, Chile", "@lucianghinda, Bucharest, Romania"])
    end

    it do
      expect( helloworld.generate_tweet ).to eq(<<~TWEET.join)
        Hey @alterisian, @bsilva96, @lucianghinda, #helloworld_rb is almost finished in New Delhi, India.
        Can we hand over the work to you?
        Join https://meet.jit.si/TodayMálagaTomorrowWeMake!
      TWEET
    end
  end
end
