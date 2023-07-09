#!/bin/sh

#------------------------------------------------------------
# Cmd Test Shell : [ping]_[NetworkConnecting]
#------------------------------------------------------------
function ping_NetworkConnecting(){
    echo 
    echo "## ping Start ##"
    echo
    # Basic Information Start
    echo
    echo " Command  : ping "
    echo " HowToUse : ping [Argument1] [Option] "  
    echo "            [Argument1] : Host DomainName or IP "
    echo "            [Option : -c] : Number of Packet Transmissions "
    echo "            [Option : -i] : Packet Transmissions Interval(Seconds) "
    echo "            [Option : -t] : The Maximum Time To Wait For a Response "
    echo
    # Basic Information End
    # Preparation Start
    echo
    echo
    # Preparation End
    # Example Start
    # Example 01 (Not Option : Packet Transmissions check )
    echo
    echo " ping google.com"
    ping google.com
    echo
    # Example 02 (Option -c : Number of Packet Transmissions )
    echo
    echo " Option -c : Number of Packet Transmissions "
    echo " ping google.com -c 3"
    ping google.com -c 3
    echo
    # Example 03 (Option -i : Packet Transmissions Interval(Seconds) )
    echo
    echo " Option -i : Packet Transmissions Interval(Seconds) "
    echo " ping google.com -i 3"
    ping google.com -i 3
    echo
    # Example 04 (Option -t : The Maximum Time To Wait For a Response )
    echo
    echo " Option -t : The Maximum Time To Wait For a Response "
    echo " ping google.com -t 2"
    ping google.com -t 2
    echo
    # Example End
    echo
    echo "## ping End ##"
    echo 
}

ping_NetworkConnecting