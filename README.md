## Welcome to GitHub Pages

You can create Nagios host configuration file for more than one hosts with this simple Powershell by using a CSV file.

```markdown
Sample CSV File:

HostName,IP,TemplateName,Logo,ParentHost
gw_device,192.168.0.254,network_device,net_device_logo.png,Nagios_Host
deneme,192.168.0.1,windows-server,Windows_Server2_Logo.png,gw_device
deneme02,192.168.0.2,linux-server,Tux_Logo.png,gw_device

```

The powershell file can be used as:

```markdown
.\Nagios_Host_Config.ps1 -hostfile hosts.csv -outconfig sampleConfig.txt
```
The output file will be as:


```markdown
define host {
 host_name        gw_device
 alias        gw_device
 address        192.168.0.254
 parents        Nagios_Host
 use        network_device
icon_image        net_device_logo.png
}

define host {
 host_name        deneme
 alias        deneme
 address        192.168.0.1
 parents        gw_device
 use        windows-server
icon_image        Windows_Server2_Logo.png
}

define host {
 host_name        deneme02
 alias        deneme02
 address        192.168.0.2
 parents        gw_device
 use        linux-server
icon_image        Tux_Logo.png
}define host {
 host_name        gw_device
 alias        gw_device
 address        192.168.0.254
 parents        Nagios_Host
 use        network_device
icon_image        net_device_logo.png
}

define host {
 host_name        deneme
 alias        deneme
 address        192.168.0.1
 parents        gw_device
 use        windows-server
icon_image        Windows_Server2_Logo.png
}

define host {
 host_name        deneme02
 alias        deneme02
 address        192.168.0.2
 parents        gw_device
 use        linux-server
icon_image        Tux_Logo.png
}
```


 fileYou can use the [editor on GitHub](https://github.com/HCaglar/NagiosHostConfigPowerShell/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/HCaglar/NagiosHostConfigPowerShell/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
