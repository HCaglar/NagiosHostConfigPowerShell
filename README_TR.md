## Nagios Host Config Powershell GitHub sayfasına hoş geldiniz.

You can access the English version of this page by clicking this [link.](https://github.com/HCaglar/NagiosHostConfigPowerShell/blob/master/README.md)

[Nagios](https://www.nagios.org) açık kaynak bir sistem ve ağ izleme uygulamasıdır.

Bu powershell betiği ile CSV bir dosyadan kayıtları okuyarak, Nagios Host config dosyası oluşturabilirsiniz.


```markdown
Örnek CSV dosya:

HostName,IP,TemplateName,Logo,ParentHost
Host_gw_device,192.168.0.254,network_device,net_device_logo.png,Nagios_Host
Host_Win_Server,192.168.0.1,windows-server,Windows_Server2_Logo.png,gw_device
Host_Tux_Server,192.168.0.2,linux-server,Tux_Logo.png,gw_device

```

Powershell betiği şu şekilde kullanabilirsiniz:

```markdown
`.\Nagios_Host_Config.ps1 -hostfile hosts.csv -outconfig sampleConfig.txt`
```

Örnek bir config dosya şu şekilde oluşturulacaktır:

```markdown
define host {
 host_name        Host_gw_device
 alias        Host_gw_device
 address        192.168.0.254
 parents        Nagios_Host
 use        network_device
icon_image        net_device_logo.png
}

define host {
 host_name        Host_Win_Server
 alias        Host_Win_Server
 address        192.168.0.1
 parents        gw_device
 use        windows-server
icon_image        Windows_Server2_Logo.png
}

define host {
 host_name        Host_Tux_Server
 alias        Host_Tux_Server
 address        192.168.0.2
 parents        gw_device
 use        linux-server
icon_image        Tux_Logo.png
}
```
Powershell betik dosyasını [burada bulabilirsiniz:](https://github.com/HCaglar/NagiosHostConfigPowerShell/blob/master/Nagios_Host_Config.ps1)