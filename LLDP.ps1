#   Checking for installed module. If Installed script is going to 
#   check the connection to the switch. 
#   If not it will install module, then check the connection.

if (Get-Module PSDiscoveryProtocol -ListAvailable) {            
    $Packet = Invoke-DiscoveryProtocolCapture -Type LLDP;       
    Get-DiscoveryProtocolData -Packet $Packet;
}

else {
    Install-Module -name PSDiscoveryProtocol -force;
    $Packet = Invoke-DiscoveryProtocolCapture -Type LLDP;
    Get-DiscoveryProtocolData -Packet $Packet;
};
