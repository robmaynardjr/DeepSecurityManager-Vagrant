# Vagrant Deep Security Manager Build

## Prereqs

You will need to create `assets/vagrant_data/answer.txt` 

This .txt file will contain the variable values required for the silent Deep Security Manager installation. Used the below as a guide to creating your answer.txt file.

```
AddressAndPortsScreen.ManagerAddress=10.xxx.xxx.xxx 
AddressAndPortsScreen.NewNode=True 
UpgradeVerificationScreen.Overwrite=False 
LicenseScreen.License.-1=XY-ABCD-ABCDE-ABCDE-ABCDE-ABCDE-ABCDE 
DatabaseScreen.DatabaseType=Microsoft SQL Server
DatabaseScreen.Hostname=10.xxx.xxx.xxx 
DatabaseScreen.Transport=TCP 
DatabaseScreen.DatabaseName=XE 
DatabaseScreen.Username=DSM 
DatabaseScreen.Password=xxxxxxx 
AddressAndPortsScreen.ManagerPort=4119 
AddressAndPortsScreen.HeartbeatPort=4120 
CredentialsScreen.Administrator.Username=masteradmin 
CredentialsScreen.Administrator.Password=xxxxxxxx 
CredentialsScreen.UseStrongPasswords=False 
SecurityUpdateScreen.UpdateComponents=True 
SecurityUpdateScreen.Proxy=False 
SecurityUpdateScreen.ProxyType="" 
SecurityUpdateScreen.ProxyAddress="" 
SecurityUpdateScreen.ProxyPort="" 
SecurityUpdateScreen.ProxyAuthentication="False" 
SecurityUpdateScreen.ProxyUsername="" 
SecurityUpdateScreen.ProxyPassword="" 
SoftwareUpdateScreen.UpdateSoftware=True 
SoftwareUpdateScreen.Proxy=False 
SoftwareUpdateScreen.ProxyType="" 
SoftwareUpdateScreen.ProxyAddress="" 
SoftwareUpdateScreen.ProxyPort="" 
SoftwareUpdateScreen.ProxyAuthentication="False" 
SoftwareUpdateScreen.ProxyUsername="" 
SoftwareUpdateScreen.ProxyPassword="" 
SoftwareUpdateScreen.ProxyAuthentication="False" 
RelayScreen.Install=True 
SmartProtectionNetworkScreen.EnableFeedback=False
```

### Required Software
- Vagrant 2.2.3
- ChefDK 3.6.57

## Run

Clone the repository.

`cd deepSecurity`

`vagrant up`

And that's it. Within minutes you'll have a local VM running Deep Security Manager. The Vagrantfile in this project sets the server address to 192.168.33.10 on a private Virtualbox network. To access the Deep Security Web Management Console, enter this address in your web browser once Vagrant has completed deploying:

`https://192.168.33.10:4119`
