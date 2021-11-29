# Connec using AnyConnect from terminal

https://superuser.com/questions/649614/connect-using-anyconnect-from-command-line/837753

Assuming `/opt/cisco/anyconnect/bin/vpnagentd` is running as it automatically should be:

To connect:

    printf 'USERNAME\nPASSWORD\ny' | /opt/cisco/anyconnect/bin/vpn -s connect HOST
    
    
