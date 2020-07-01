<#
2020 Silent :-)
.SYNOPSIS
With this script, you can create Nagios Host configuraton file for multiple hosts by importing from a CSV file.

.DESCRIPTION

Sample CSV File:

HostName,IP,TemplateName,Logo,ParentHost
Host_gw_device,192.168.0.254,network_device,net_device_logo.png,Nagios_Host
Host_Win_Server,192.168.0.1,windows-server,Windows_Server2_Logo.png,gw_device
Host_Tux_Server,192.168.0.2,linux-server,Tux_Logo.png,gw_device

.PARAMETER hosts
CSV file path will be checked.

.PARAMETER configfile
file extention does not matter, you can use .txt, .csv, .cfg etc.

.EXAMPLE
./Nagios_Host_Config.ps1 -hostfile hosts.csv -configfile sampleConfig.txt

.NOTES
Put some notes here.

.LINK
https://github.com/HCaglar/NagiosHostConfigPowerShell

#>


#region Import CSV File if it exists

#endregion Import CSV File if it exists

#region output file

#endregion output file


#region TRY and Catch

#endregion TRY and Catch




#region
#endregion
