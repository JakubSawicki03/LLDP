Set-ExecutionPolicy Bypass;

#   Checking for installed module. If Installed script is going to 
#   check the connection to the switch. 
#   If not it will install the module, then check the connection.

if (Get-Module PSDiscoveryProtocol -ListAvailable) {            
    $Packet = Invoke-DiscoveryProtocolCapture -Type LLDP;       
    $Results = Get-DiscoveryProtocolData -Packet $Packet;
    Write-Output $Results | Out-String;
}

else {
    Install-Module -name PSDiscoveryProtocol -force;
    $Packet = Invoke-DiscoveryProtocolCapture -Type LLDP;
    $Results = Get-DiscoveryProtocolData -Packet $Packet;
    Write-Output $Results | Out-String;
}; 
