# ZippaTTL

Simple Ruby Sinatra app using Google Translate API to download a MP3 of requested text.  
Using this to send http requests from ZipatoBox http://www.zipato.com/ to the app and play MP3.  
Running this on a Rasberry PI works fine.

Ruby Gems:	
		
1. Sinatra	
2. Sonos (https://github.com/soffes/sonos) 


## Installation
	
	cd $INSTALLATION_PATH
	bundle install
	rackup -o $IP_OF_YOURHOST

Now you should have a webserver up and running on $IP_OF_YOURHOST:9292

## TODO
* Define Sonos ip
* Support diffrent language
* Upload mp3 files
* Build more functionallity to controll sonos.

![alt tag](https://cloud.githubusercontent.com/assets/266624/6515208/43e424d6-c388-11e4-9333-2df0f67344b9.png)


