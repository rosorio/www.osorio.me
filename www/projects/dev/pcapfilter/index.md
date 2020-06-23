## pcapfilter
*pcapfilter is a small tool to filter inputs from a pcap file and generates a reduced pcap file without affecting content*

## Changes

### v0.2 :

* The negation 'not' can be wrote 'no'
* Add a default rule 'all' who matchs all the packets
  * You can now write rules like 'all no sport 10' to match all the packets except those with the specified source port
  * if only 'no' rules are provided, the 'all' rule is added by default before any other
* Add kinda Linux support (thanks to fser)

## Usage

### pcapfilter src dst rules
* src: if filename
* dst: of filename

### rules
* by address: [src|dst|addr] ip_address
* by port: [sport|dport|port] portno

Adding the word 'not' or 'no' before a rule does the opposite

Rules matching : last match wins

Examples :

filter all the packets from 192.168.1.1

`pcapfilter if capture.pcap of sample.pcap src 192.168.1.1`

filter all the packets from 192.168.1.1 and with port 287

`pcapfilter if capture.pcap of - src 192.168.1.1 | pcapfilter if - of sample.pcap port 287`

filter all the packets from 192.168.1.1 and without port 287

`pcapfilter if capture.pcap of - src 192.168.1.1 | pcapfilter if - of sample.pcap all not port 287`

# Download

**TO FIX**: This is a BSD makefile only.


| Version | Sources | Checksum |
|---------|---------|----------|
| v0.1    | [pcapfilter-0.1.tar.gz](http://files.bebik.net/pcapfilter/pcapfilter-0.1.tgz) | [pcapfilter-0.2.sum](http://files.bebik.net/pcapfilter/pcapfilter-0.1.sum) |
| v0.2    | [pcapfilter-0.2.tar.gz](http://files.bebik.net/pcapfilter/pcapfilter-0.1.tgz) | [pcapfilter-0.2.sum](http://files.bebik.net/pcapfilter/pcapfilter-0.1.sum) |


# License

The code is delivered under [BSD License](https://en.wikipedia.org/wiki/BSD_licenses)
