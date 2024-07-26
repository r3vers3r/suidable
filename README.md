# SUIDABLE

## WHAT IS IT?

**SUIDABLE** is a Bash script that is thought to be sent to a Linux victim machine once this is compromised and foothold is gained. This tool checks on an automated way if any of the binaries that is present on the system and counts with an SUID bit set is included on GTFOBINS as a binary that might lead to a user pivoting or privilege escalation. The aim of this tool is to save some precious time to its user. Time that would be otherwise lost checking each binary with an SUID bit set one by one.

## THANKS

Thanks from heart to **GTFOBINS (https://gtfobins.github.io/) creators Emilio Pinna / Andrea Cardaci and all collaborators** for sharing with all such an amazing tool that was the starting point of this humble project.

## HOW DOES IT WORK?

**1.** In case you execute the tool without any parameter the help panel will display with. This same panel can be shown executing the tool followed by parameter **-h**

````
./suidable.sh
````

![image](https://github.com/user-attachments/assets/240e9bc2-1fc7-4b06-9ac4-84ee842bd4be)


**2.** The first thing to be done before every use, is to execute the script followed by **-u** parameter to make sure the data that will be used to check if any of the SUID binaries present on the system can lead to a user pivoting or a privilege escalation.

````
./suidable.sh -u
````

**2.1** In case there isn't any previously existing data, the tool will notice it and the downloadof all necessary files will automatically start.

![Captura de pantalla 2024-07-25 231549](https://github.com/user-attachments/assets/0dc702df-e976-478f-92cb-6a487653a32e)

**2.2** And in case the data is present but this isn't up to date, the tool will make sure to download the latest data.

![image](https://github.com/user-attachments/assets/8cafc9d3-663e-4357-ae9b-14671dd2e779)

**2.3** In case de data is present and is up to date, the tool will make you know you are good to continue.

![Captura de pantalla 2024-07-25 231604](https://github.com/user-attachments/assets/4a1cc376-df0f-48bd-aba5-19ca74562eb4)

**3.** Once you made sure to have all dependencies up to date, it is time to check if any of the SUID binaries present on the system can lead to a user pivoting or a privilege escalation. This can be done executing the tool followed by parameter **-s**

````
./suidable.sh -s
````

**3.1** In case of positive findings, the tool will let you know which are these binaries.

![Captura de pantalla 2024-07-25 231621](https://github.com/user-attachments/assets/b8269881-6af6-414e-b070-661efd56cc59)

**3.2** Otherwise, this other output will show up. Don't give up. Continue enumerating the system until you find a way to root the machine.

![Captura de pantalla 2024-07-25 231645](https://github.com/user-attachments/assets/75e8e6a5-f1c3-4b49-8b47-90abadf4217d)

## CYBERSECURITY TOOL ACKNOWLEDGEMENT

By using this cybersecurity tool, you acknowledge and agree to the following terms: 

**1. Responsible Use:** This tool is intended for controlled environments, such as labs and agreed-upon penetration tests. You must use it responsibly and legally.
**2. No Illicit Activities:** The developer (me) is not responsible for any illicit or unauthorized use of this tool. You agree not to engage in any illegal activities.
**3. Disclaimer:** This tool is provided "as is," without warranties or guarantees. The developer disclaims any liability for damages, losses, or consequences arising from its use.

