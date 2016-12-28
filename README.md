rsyslog image support three variables:
* LISTEN_UDP - enable rsyslog udp module.
* LISTEN_SOCKET - enable socket module.
* LOG_TARGET - write all logs to the target(file/server/etc).

1. Create dir for socket file and logs: `mkdir /tmp/rsyslog`

2. Start udp rsyslog server: `docker run -d -p 5140:514/udp -e LISTEN_UDP=true -e LOG_TARGET=/rsyslog/syslog -v /tmp/rsyslog:/rsyslog sspeaker/rsyslog`

3. Replace !!!HOST_IP!!! with IP of the docker host system and start the agent:`docker run -d -e LISTEN_SOCKET=true -e LOG_TARGET=@!!!HOST_IP!!!:5140 -v /tmp/rsyslog:/rsyslog sspeaker/rsyslog`

4. Star nginx:`docker run -d -p 8080:80 -v /tmp/rsyslog:/rsyslog sspeaker/nginx`

5. 8080 port should be avaliable on docker host: `curl http://127.0.0.1:8080`. Logs from the server are here: `/tmp/rsyslog/syslog`
