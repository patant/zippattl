require 'net/http'

set :public_folder, 'public'

class ZippaTTL < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/addfile' do
    File.write("public/files/#{params["audio"]}.mp3", Net::HTTP.get(URI.parse("http://translate.google.com/translate_tts?tl=en&q=#{params["audio"]}")))
    redirect to('/listmp3s')
  end

  get '/listmp3s' do
    @files = Dir.entries("./public/files").select {|f| !File.directory? f}
    erb :listmp2s
  end

  get '/listsonos' do
    erb :listsonos
  end

  post '/deletefile' do
    if File.delete("./public/files/#{params["file"]}")
      status 200
    else
      status 500
    end
  end

  post '/playmp3' do
    file = params["file"]
    volume = params["volume"]
    status 400 if file == nil 
    status 400 if volume == nil 
    @@logging_enabled = true
    system = Sonos::System.new
    if system.topology.empty?
      system = Sonos::System.new
        if system.topology.empty?
          puts "ERROR Missing sonos system"
          status 400
        end
    end
    speaker = system.speakers.first
    speaker.volume = volume
    mp3_url = 'http://' + request.env["HTTP_HOST"] + '/files/' + file
    speaker.play mp3_url
    speaker.play
  end

end
