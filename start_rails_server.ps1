$hostname = "namantaran.local"

# Retrieve all IPv4 addresses excluding loopback addresses
$ipAddresses = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -notlike "*Loopback*" }

# Select the first IP address from the list, which could be either LAN or Wi-Fi
$ip = $ipAddresses | Select-Object -First 1 | Select-Object -ExpandProperty IPAddress

# Define the hosts file path
$hostsPath = "C:\Windows\System32\drivers\etc\hosts"

# Read the hosts file
$hostsContent = Get-Content $hostsPath

# Remove any existing entry for the hostname
$hostsContent = $hostsContent | Where-Object { $_ -notmatch $hostname }

# Add the new entry for the hostname
$entry = "$ip `t $hostname"
$hostsContent += $entry

$entry1 = "`n 127.0.0.1 `t $hostname"
$hostsContent += $entry1

$entry2 = "`n 0.0.0.0 `t $hostname"
$hostsContent += $entry2

# Write the updated hosts file
Set-Content $hostsPath -Value $hostsContent -Force

# Start the Rails server
Start-Process -NoNewWindow -FilePath "rails" -ArgumentList "server -b $ip -p 3000"