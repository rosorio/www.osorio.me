*Podcastdl is a CLI podcast client intended to be used to download podcasted files using a cron like tool*

# Usage

`podcastdl -c <path/to/podcast.cfg> -o /some/directory -d <number> [-hilv]`

* -c path/to/podcast.cfg : The filename containing the list of podcasts
* -o /some/directory : The target directory where the files will be saved
* -l : Set the log to be written in syslog, otherwise log are written to stderr
* -i : Add an additional .info file with information about the podcast
* -d &lt;number&gt; : Set the maximum number of days a podcast can have to be downloaded
* -v : Verbose mode for debug
* -h : help

# Sample usage
Download my podcast list for the last three days and store the files in the ./my/output/path directory

    % podcastdl -c myplist.cfg -d 3 -o ./my/output/path

# Configuration files

Podcastdl uses a single configuration file containing the list of podcast URLs to check and download. This file is provided to the application through the command line as show in the usages.

A sample configuration file

    % cat path/to/podcast.cfg
    http://radiofrance-podcast.net/podcast09/rss_11558.xml
    http://downloads.bbc.co.uk/podcasts/radio4/fooc/rss.xml
    http://www.rte.ie/radio1/podcast/podcast_liveline.xml

# Download

The latest version is the v0.3.3, see [changelog](http://files.bebik.net/podcastdl/changelog.txt) for details.

| Version | Sources                | Checksum              |
|---------|------------------------|-----------------------|
| v0.3.3  | [podcastdl-0.3.3.tar.gz](v0.3.3podcastdl-0.3.3.tar.gzpodcastdl-0.3.3.sum) |  [podcastdl-0.3.3.sum](http://files.bebik.net/podcastdl/podcastdl-0.3.3.sum) |
| v0.3.2  | [podcastdl-0.3.2.tar.gz](v0.3.2podcastdl-0.3.2.tar.gzpodcastdl-0.3.2.sum) |  [podcastdl-0.3.2.sum](http://files.bebik.net/podcastdl/podcastdl-0.3.2.sum) |
| v0.3.1  | [podcastdl-0.3.1.tar.gz](v0.3.1podcastdl-0.3.1.tar.gzpodcastdl-0.3.1.sum) |  [podcastdl-0.3.1.sum](http://files.bebik.net/podcastdl/podcastdl-0.3.1.sum) |
| v0.3.0  | [podcastdl-0.3.0.tar.gz](v0.3.0podcastdl-0.3.0.tar.gzpodcastdl-0.3.0.sum) |  [podcastdl-0.3.0.sum](http://files.bebik.net/podcastdl/podcastdl-0.3.0.sum) |
| v0.2.1  | [podcastdl-0.2.1.tar.gz](v0.2.1podcastdl-0.2.1.tar.gzpodcastdl-0.2.1.sum) |  [podcastdl-0.2.1.sum](http://files.bebik.net/podcastdl/podcastdl-0.2.1.sum) |

Podcastdl is also available :
* from [ports](http://www.freshports.org/multimedia/podcastdl/) for FreeBSD users
* from [pkgsrc](http://pkgsrc.se/net/podcastdl) for [netbsd and more](http://www.pkgsrc.org/#platforms) users

# Requirements

Podcastdl relies on [libmrss](http://www.autistici.org/bakunin/libmrss/) for the xml parsing. It currently use the 0.19.2 version.

# License

The code is delivered under [BSD License](https://en.wikipedia.org/wiki/BSD_licenses)
