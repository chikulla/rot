#!/bin/sh

while true; do
    sleep 10
    
    echo "Rotating Tor circuits..."
    
    # Send NEWNYM signal to each Tor instance to get new circuits
    docker exec tor1 kill -HUP $(docker exec tor1 cat /var/lib/tor/tor.pid) 2>/dev/null || true
    docker exec tor2 kill -HUP $(docker exec tor2 cat /var/lib/tor/tor.pid) 2>/dev/null || true
    docker exec tor3 kill -HUP $(docker exec tor3 cat /var/lib/tor/tor.pid) 2>/dev/null || true
    
    echo "Circuit rotation complete"
done