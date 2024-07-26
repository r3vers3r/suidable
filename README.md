# SUIDABLE

## What is it?

**SUIDABLE** is a simple Bash script that is thought to be sent to a Linux victim machine once this is compromised and foothold is gained. This tool checks on an automated way if any of the binaries that is present on the system and counts with an SUID bit set is included on GTFOBINS as a binary that might lead to a user pivoting or privilege escalation. The aim of this tool is to save some precious time to its user. Time that would be otherwise lost checking each binary with an SUID bit set one by one.

## Thanks

Thanks from heart to **GTFOBINS (https://gtfobins.github.io/) creators Emilio Pinna / Andrea Cardaci and all collaborators** for sharing with all such an amazing tool that was the starting point of this humble project.

## How does it work?

**1.** In case you execute the tool without any parameter the help panel will display with

````
./suidable.sh
````

