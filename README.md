Build Rakudo Star for Windows
=============================

Prerequisites:
--------------
* [Wget](https://eternallybored.org/misc/wget/)
* [Git](https://git-scm.com/)
* [WiX Toolset](https://wixtoolset.org/)
* [Strawberry Perl](http://strawberryperl.com/)
* [Gpg4win](https://www.gpg4win.org/) (Optional)

Make sure `C:\rakudo` is deleted before starting

Usage:
------

* Build the MSI:  
`build.bat YYYY.MM`
* Build the MSI and calculates the sha256 checksum:  
`build.bat YYYY.MM --checksum`
* Build the MSI, calculates the sha256 checksum, and sign the MSI with your key:  
`build.bat YYYY.MM --checksum --sign`

Output:
-------
* rakudo-star-YYYY.MM-01-win-x86_64-(JIT).msi
* rakudo-star-YYYY.MM-01-win-x86_64-(JIT).msi.sha256.txt
* rakudo-star-YYYY.MM-01-win-x86_64-(JIT).msi.asc