# Top 10 IP from apache log (historical) (/etc/httpd/apache/logs)
awk '{ print $1}' access_log | sort | uniq -c | sort -nr | head -n 10

# concurrent connections to apache
netstat -nt | grep :80 | wc -l

# number of connections per ip to apache
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n

# established connections only
netstat -ntu | grep ESTAB | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr

# connections per port
netstat -tuna | awk -F':+| +' 'NR>2{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n

# ssh logs
tail -500 /var/log/secure | grep 'sshd'
