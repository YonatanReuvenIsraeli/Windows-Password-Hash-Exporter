# Windows Password Hash Exporter v5.0.8
Export Windows password hashes to a location of your choice.

## THIS IS FOR EDUCATIONAL PURPOSES ONLY! DO NOT USE THIS ON SOMEONE ELSE'S PC WITHOUT THEIR EXPLICIT PERMISSION! THIS IS A HACK! CONTINUE AT YOUR OWN RISK! @YONATANREUVENISRAELI HOLDS NO RESPONSIBILITY FOR ANYTHING THAT HAPPEND, IS HAPPENING, AND/OR WILL HAPPEN BECAUSE OF THIS BATCH FILE!

## Notes
- You will need to use impacket-secretsdump in Kali Linux to view the hashes.  
- Once you have the hash, you can use a tool like Hashcat to crack the hash.  
- The hashing algorithm used by Windows to hash the passwords is the NTLM hash algorithm.  
- The hash mode in Hashcat for NTLM is 1000.  
- This will not work if NTLM is disabled.
