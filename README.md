# BishBashBosh

![alt tag](https://github.com/tomhiggins/BishBashBosh/raw/master/bishbashbosh.jpg)

**What is This?**
With one line you can get and listen/share the Podcasts you love. 

**Why?**
Bloated overly feature stuffed Podcast listening apps with restrictive eulas and walled garden methodologies break some of what made Podcasts the joy they were always meant to be. The Podcasting method was created to make it easier to get the audio offerings you love to hear and to offer up your audio creations to a wider audience. 

Get the app out of the way, just grab the Podcasts and listen. **BishBashBosh**....done. 

**When Would I Use This?**
If you are in an office, library, hackerspace, usergroup , on the road , hanging at a friend's house, in your own home and you want to listen to /share the podcasts you love. By using the Audio Server options you will be streaming these out to anyone who wants to listen on the same network as the machine/device you are running this on. Instant Streaming Podcast Station. BishBashBosh!

**How To Use**
- Make a directory that will hold the podcasts when they are downloaded. 
- In that directory create a files called **podcasts.txt** that contains one podcast's rss feed url per line.  There is an example **podcasts.txt** available in this repo.  
- Then simply copy  one of the **Options** and paste it in a command line.
  - For repeated use save into a .sh file and run that instead. 
- Enjoy the Podcasts. Given the option you used the Podcasts are either being streamed over your local net, are playing on your Android, or are waiting in the directory you created for you to open them up with the audio player of your liking. 


**Your Options**
Here are a few lines to get at the Podcasts you want. Each one does it in a slightly differnt way and is aimed at differing situations...

**One Line One File** - This will grab **all** the episodes currently offered in the podcasts rss feeds. 

**One Line One File Audio Server** - This will grab **all** the episodes currently offered in the podcasts rss feeds. It also opens a **local net audio server**  you control from http://machinesip:8088/ and play it on any streaming media app  from any device connected to your local net. Simply tell it to stream from http://machinesip:8085/

**One Line One File One Show Per Podcast** - This will grab the **most current** epsiode offered in the podcasts rss feeds. 

**One Line One File One Show Per Podcast Audio Server** - This will grab the **most current** episodes offered in the podcasts rss feeds. It also opens a **local net audio server**  you control from http://machinesip:8088/ and play it on any streaming media app  from any device connected to your local net. Simply tell it to stream from http://machinesip:8085/

**Android Termux One Line One File One Show Auto Play**  -  To be run on an Android device that has Termux installed. This will grab the **most current** episode offered in the podcasts rss feeds. It will play them one at at time on the Android device.  


**BishBashBosh** running in a Linux terminal and being controled from a web browser
![alt tag](https://github.com/tomhiggins/BishBashBosh/raw/master/bishbashboshss.jpg)

**Inspiration**
- The orignal Bash based podcatcher by Linc - **BashPodder** - http://www.lincgeek.org/bashpodder/
- **Wget Mp3Blogs**, the pre podcast lifestyle -   - http://www.veen.com/jeff/archives/000573.html


**FAQ**

**When I am using the Audio Stream options how can I control what is being played?**
 - From any web browser on the same network you are running this on goto **http://servingmachinesip:8088** 
 - Leave the first  input section , the one for User Name, blank
 - The default passwrod is  **CHANGEME** , and yes you should really change that to something less deafultish. 

You should now see a web page with controls that will allows you to pick what you want to be streamed and in which order.  You can also use an app on your phone/device such as RemoteForVLC (https://f-droid.org/packages/org.peterbaldwin.client.android.vlcremote/)


**How do I change the deafult password**
Before you hit enter and run the code 
 - Use the arrow keys so that your cursor is at the word CHANGEME 
 - Change it to something not so much of a defualt nature. 
 - Use the arrow keys to you get to the end of the line
 - Hit enter
 This will now be the password you will use to log into the controls for the Audio Stream.


**How do I use an APP to listen to the stream?**
My goto app is VLC (PlayStore or Fdroid). Your milage will vary. So long as the app has the option to stream audio you are good to go. Point your app to **http://servingmachineip:8085**

**How do I find out the IP of the machine I am running the AudioServer on?**
There are many ways to find this out depending on the type of machine you are using to run this. 
On Linux, go to the machine that is running the audio server and cut and paste this into a Terminal/Command Line...
**echo "$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')"**
The result will be a number like  **192.168.1.23** This is the IP number of that machine. So in this example to listen to the stream from anywhere on that network just point your Audio app to **http://192.168.1.23:8085**


**This is cool but I do not want to stream podcasts, I have a ton of directories of music I want to stream out to my local  network. Please, how can I use one line of code and be an InstaDJRadioStation?**

This line is for you. 
**find /directory/where/your/music/is/ -name "*mp3">playlist.m3u | ip="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')" | cvlc --no-auto-preparse -I http --http-password CHANGEME --http-host $ip --http-port 8088 --sout-keep --sout='#duplicate{dst=gather:std{access=http,mux=mpeg1,dst=:8085},dst=display,select="novideo"}' -LZ --no-auto-preparse playlist.m3u**

 - You should run this in a directory where yo have rights to read and write files
 - Change **/directory/where/your/music/is/** to the directory path where the music stash you want to stream is kept.
   - This code will go into the directories under the main music directory as well. 
 - Listening and Controling the Audio Stream is the same as for the other code, see Above
 
 NB. For those with large collections of music the playlists may take a moment or three to load on the Control web page. Giv it time, it is working hard for your pleasure. 
