set RAKUDO_VER=%1

rem Download Rakudo and build
wget https://github.com/rakudo/rakudo/releases/download/%RAKUDO_VER%/rakudo-%RAKUDO_VER%.tar.gz
tar -xvzf rakudo-%RAKUDO_VER%.tar.gz
cd rakudo-%RAKUDO_VER%
perl Configure.pl --backends=moar --gen-moar --moar-option="--cc=gcc" --moar-option="--make=gmake" --relocatable --prefix=C:\rakudo
gmake
gmake test
gmake install

rem Download Zef and install
git clone https://github.com/ugexe/zef.git
cd zef
C:\rakudo\bin\raku.exe -I. bin\zef install .

rem Install modules
cd ..\..
C:\rakudo\bin\raku.exe C:\rakudo\share\perl6\site\bin\zef install .

rem Copy required dll from Strawberry Perl
copy C:\strawberry\perl\bin\libwinpthread-1.dll C:\rakudo\bin
copy C:\strawberry\perl\bin\libgcc_s_seh-1.dll C:\rakudo\bin

rem Package .msi
mkdir output
heat dir C:\rakudo -gg -sfrag -cg RakudoStar -dr INSTALLROOT -srd -out star-files.wxs
candle star-files.wxs
candle -dSTARVERSION=%RAKUDO_VER% star.wxs
light -b C:\rakudo -ext WixUIExtension star-files.wixobj star.wixobj -o output\rakudo-star-%RAKUDO_VER%-01-win-x86_64-(JIT).msi

rem SHA256
if "%2"=="--checksum" CertUtil -hashfile output\rakudo-star-%RAKUDO_VER%-01-win-x86_64-(JIT).msi SHA256 | findstr /V ":" > output\rakudo-star-%RAKUDO_VER%-01-win-x86_64-(JIT).msi.sha256.txt 

rem GPG signature
if "%3"=="--sign" gpg --armor --detach-sig output\rakudo-star-%RAKUDO_VER%-01-win-x86_64-(JIT).msi

rem Clean up
del rakudo-%RAKUDO_VER%.tar.gz
del star-files.wxs
del star-files.wixobj
del star.wixobj
del output\rakudo-star-%RAKUDO_VER%-01-win-x86_64-(JIT).wixpdb
echo y | rmdir /s rakudo-%RAKUDO_VER%
