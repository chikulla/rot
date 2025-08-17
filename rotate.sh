#!/bin/sh

while true; do
    echo "Rotating Tor circuits..."
    
    # Send NEWNYM signal to each Tor instance to get new circuits
    docker exec tor1 kill -HUP 1 2>/dev/null || true
    sleep 3
    docker exec tor2 kill -HUP 1 2>/dev/null || true
    sleep 3
    docker exec tor3 kill -HUP 1 2>/dev/null || true
    sleep 3
    
    echo "Circuit rotation complete"
done