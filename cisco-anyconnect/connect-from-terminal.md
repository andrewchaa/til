# Connec using AnyConnect from terminal

Assuming `/opt/cisco/anyconnect/bin/vpnagentd` is running as it automatically should be:

To connect:

    printf 'USERNAME\nPASSWORD\ny' | /opt/cisco/anyconnect/bin/vpn -s connect HOST
    
    
