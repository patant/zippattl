require 'net/http'

set :public_folder, 'public'

class ZippaTTL < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/play' do
    p params["text"]
    File.write("public/files/#{params["text"]}.mp3", Net::HTTP.get(URI.parse("http://translate.google.com/translate_tts?tl=en&q=#{params["text"]}")))
    system = Sonos::System.new
    p system
    "sonos not found" if system == nil
    speaker = system.speakers.first
    p speaker
    "No speaker found" if speaker == nil
    speaker.volume = 10
    speaker.play 'http://10.0.1.25:9292/files/test.mp3'
    
    speaker.play
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

end
