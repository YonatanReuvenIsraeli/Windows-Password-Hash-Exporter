# Windows Password Hash Exporter v5.0.1

## This batch file, named "Windows Password Hash Exporter.bat", is designed for educational purposes only to demonstrate potential vulnerabilities in Windows operating systems. It should only be used in controlled testing environments with explicit authorization.

## Notes:
**1.** You will need to use impacket-secretsdump in Kali Linux to view the hashes.  
**2.** Once you have the hash, you can use a tool like Hashcat to crack the hash.  
**3.** The hashing algorithm used by Windows to hash the passwords is the NTLM hash algorithm.  
**4.** The hash mode in Hashcat for NTLM is 1000.  
**5.** This will not work if NTLM is disabled.
