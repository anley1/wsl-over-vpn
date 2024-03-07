#!/bin/bash
sudo chattr -i /etc/resolv.conf
sudo sed -i '/nameserver/d' /etc/resolv.conf
powershell.exe -Command '(Get-DnsClientServerAddress -AddressFamily IPv4).ServerAddresses | ForEach-Object { "nameserver $_" }' | tr -d '\r' | sudo tee -a /etc/resolv.conf > /dev/null
sudo chattr +i /etc/resolv.conf
