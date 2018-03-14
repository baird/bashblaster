# Top 10 IP from apache log
awk '{ print $1}' access_log | sort | uniq -c | sort -nr | head -n 10

# concurrent connections to apache
netstat -nt | grep :80 | wc -l

# number of connections per ip to apache
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n

# established connections only
netstat -ntu | grep ESTAB | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr