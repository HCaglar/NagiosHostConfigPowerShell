<#
.SYNOPSIS
By this script, you can create a Nagios Host configuraton file for multiple hosts by importing records from a CSV file.

.DESCRIPTION

Sample CSV File:

HostName,IP,TemplateName,Logo,ParentHost
Host_gw_device,192.168.0.254,network_device,net_device_logo.png,Nagios_Host
Host_Win_Server,192.168.0.1,windows-server,Windows_Server2_Logo.png,gw_device
Host_Tux_Server,192.168.0.2,linux-server,Tux_Logo.png,gw_device

.PARAMETER hosts
CSV file path;
if it in the same path with the script, use as in example;
otherwise please also give full path as:
"/username/folder/hostsfile.csv"
or
"c:\username\folder\hostsfile.csv"

.PARAMETER configfile
file extention does not matter, you can use .txt, .csv, .cfg etc.

.EXAMPLE
./Nagios_Host_Config.ps1 -hostfile hosts.csv -configfile sampleConfig.txt

.EXAMPLE
./Nagios_Host_Config.ps1 hosts.csv sampleConfig.txt

.NOTES
If you want to add another definition in the csv file;
add it as:

HostName,IP,TemplateName,Logo,ParentHost,Another_definition   <--- new definition
Host_gw_device,192.168.0.254,network_device,net_device_logo.png,Nagios_Host,new_definition_01  <-- also to records...
Host_Tux_Server,192.168.0.2,linux-server,Tux_Logo.png,gw_device,new_definition_02
...

and in the script, copy and paste the last definition line with "parents" and change it with the new definition name as:

...
"    parents`t" + $definition.ParentHost + "`n" +
--> new definition "    another_definiton`t" + $definition.another_definiton + "`n" +
"}" + "`n"

.LINK
https://github.com/HCaglar/NagiosHostConfigPowerShell

.Author
Huseyin "Silent" Caglar  - 2020 -  huseyin.caglar (at) gmail (dot) com
#:-)
#>


[CmdletBinding()]
param(
  [parameter(Mandatory=$True)]
   $hostfile,
   [parameter(Mandatory=$True)]
   $configfile
)

#region Import CSV File if it exists
if(!$hostfile)
{
Write-Output "CSV file not found!"
}
$csv=import-Csv $hostfile
#endregion Import CSV File if it exists


#writing the time info into the beginning of config file:
set-content -value "###### Config file created at $(get-date) by using csv file: $hostfile ###### `n" -path $configfile

#region preparing config file:
foreach ($definition in $csv)
{ # foreach begins here

# `t for TAB, `n for New Line character
$config_text="define host {" + "`n" +
"    host_name`t" + $definition.HostName + "`n"+
"    alias`t" + $definition.HostName + "`n"+
"    address`t" + $definition.IP + "`n"+
"    use`t`t" + $definition.TemplateName + "`n"+
"    icon_image`t" + $definition.Logo + "`n" +
"    parents`t" + $definition.ParentHost + "`n" +
"}" + "`n"
#endregion preparing config file:


# showing config also on console:
$config_text

#region outputing config to file
add-content -value $config_text -path $configfile
#endregion outputing config to file

} # foreach ends here
