# prometheus-bindrndc_textfile
When I found out that prometheus bind_exporter did support tcp clients i decided to make a small script to gather metrics from rndc [as suggested by](https://github.com/prometheus-community/bind_exporter/issues/189) [dswarbrick](https://github.com/dswarbrick)

This is the result.
if prefix is set to bindrndc ( prefix="bindrndc" ) then you'll get the following metrics:

- `bindrndc_version` 3rd field of version
- `bindrndc_udplisteners` UDP listeners per interface
- `bindrndc_debuglvl` debug level
- `bindrndc_xfersrunning` xfers running
- `bindrndc_xfersdeffered` xfers deferred
- `bindrndc_soaprogress` soa queries in progress
- `bindrndc_recursiveclients` recursive clients
- `bindrndc_tcpclients` tcp clients
- `bindrndc_tcphighwater` TCP high-water
