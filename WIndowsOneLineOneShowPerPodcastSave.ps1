del play.m3u;foreach ($podcast in (Get-Content "podcasts.txt")) {Invoke-WebRequest -Uri $podcast -Outfile 'feed.xml' ;[xml]$Content = Get-Content feed.xml;$fname=($Content.rss.channel.Item.enclosure.url|select-object -first 1); echo $fname| Out-file play.m3u -Append;Invoke-WebRequest -Uri (echo $fname) |Out-File (Split-Path ($fname) -Leaf) -NoClobber }
