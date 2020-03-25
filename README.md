Build Rakudo Star for Windows
=============================

Prerequisites:
--------------
* [Git](https://git-scm.com/)
* [WiX Toolset](https://wixtoolset.org/)
* [Strawberry Perl](http://strawberryperl.com/)
* [Gpg4win](https://www.gpg4win.org/) (Optional)

Uninstall Rakudo if it was installed previously.  
Delete `C:\rakudo` if it exists.  

Usage:
------

* Build the MSI:  
`.\build.ps1 YYYY.MM`
* Build the MSI and calculates the sha256 checksum:  
`.\build.ps1 YYYY.MM -checksum`
* Build the MSI, calculates the sha256 checksum, and sign the MSI with your key:  
`.\build.ps1 YYYY.MM -checksum -sign`

Output:
-------
* rakudo-star-YYYY.MM-01-win-x86_64-(JIT).msi
* rakudo-star-YYYY.MM-01-win-x86_64-(JIT).msi.sha256.txt
* rakudo-star-YYYY.MM-01-win-x86_64-(JIT).msi.asc