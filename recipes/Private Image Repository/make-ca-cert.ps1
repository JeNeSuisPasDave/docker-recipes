# Create a CA cert that will be used to authorized certs in containers
#
# Download the latest PKI PowerShell module from https://pspki.codeplex.com/
#
#makecert -r -pe -a sha256 -n "CN=AspenTech APC Root Certificate" -sky exchange AcpDatapumpServer.cer -sv AcpDatapumpServer.pvk
#pvk2pfx -pvk AcpDatapumpServer.pvk -spc AcpDatapumpServer.cer -pfx AcpDatapumpServer.pfx

New-SelfSignedCertificateEx `
  -Subject "CN=AspenTech APC Root Certificate" `
  -NotBefore DateTime.Parse("2016-05-16T00:00:00-0500") `
  -NotAfter DateTime.Parse("2032-05-16T00:00:00-0500") `
  -SerialNumber "00001001" `
  -AlgorithmName "RSA" `
  -KeyLength "2048" `
  -KeySpec "Signature" `
  -KeyUsage "DigitalSignature, CrlSign, KeyCertSign" `
  -IsCA $True `
  -PathLength 0 `
  -SignatureAlgorithm "SHA256" `
  -StoreLocation "LocalMachine"

x  true

