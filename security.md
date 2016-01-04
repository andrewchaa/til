# Resources

* JWT: http://bitoftech.net/2014/10/27/json-web-token-asp-net-web-api-2-jwt-owin-authorization-server/
* JWT Authentication in ASP.NET Web API: http://bitoftech.net/2015/02/16/implement-oauth-json-web-tokens-authentication-in-asp-net-web-api-and-identity-2/
* Authorisation server: https://github.com/IdentityModel/AuthorizationServer
* Simplest OAuth2: https://identityserver.github.io/Documentation/docsv2/overview/simplestOAuth.html
* OpenID: https://openid.net/

## Identity Server

* Getting started: https://identityserver.github.io/Documentation/docsv2/overview/mvcGettingStarted.html
* Documentation: https://identityserver.github.io/Documentation/docsv2/
* Videos: https://github.com/IdentityModel/AuthorizationServer/wiki
* Samples: https://github.com/identityserver/IdentityServer3.Samples
* IdentityServer3 repo: https://github.com/IdentityServer/IdentityServer3
* IdentityServer v3 and azure: http://leastprivilege.com/2014/04/22/identityserver-v3-and-azure-websites-and-other-deployment-simplifications/
* User service: https://identityserver.github.io/Documentation/docs/advanced/userService.html
* User service sample: https://github.com/IdentityServer/IdentityServer3.Samples/tree/master/source/CustomUserService

# Concepts

## SSL certificate

http://www.tldp.org/HOWTO/SSL-Certificates-HOWTO/x64.html

An example of a certificate

"the certificate contains the reference to the issuer, the public key of the owner of this certificate, the dates of validity of this certificate and the signature of the certificate to ensure this certificate hasen't been tampered with. The certificate does not contain the private key as it should never be transmitted in any form whatsoever"

```
Certificate: 
    Data: 
        Version: 3 (0x2) 
        Serial Number: 1 (0x1) 
        Signature Algorithm: md5WithRSAEncryption 
        Issuer: C=FJ, ST=Fiji, L=Suva, O=SOPAC, OU=ICT, CN=SOPAC Root CA/Email=administrator@sopac.org 
        Validity 
            Not Before: Nov 20 05:47:44 2001 GMT 
            Not After : Nov 20 05:47:44 2002 GMT 
        Subject: C=FJ, ST=Fiji, L=Suva, O=SOPAC, OU=ICT, CN=www.sopac.org/Email=administrator@sopac.org 
        Subject Public Key Info: 
            Public Key Algorithm: rsaEncryption  
            RSA Public Key: (1024 bit) 
                Modulus (1024 bit): 
                    00:ba:54:2c:ab:88:74:aa:6b:35:a5:a9:c1:d0:5a: 
                    9b:fb:6b:b5:71:bc:ef:d3:ab:15:cc:5b:75:73:36: 
                    b8:01:d1:59:3f:c1:88:c0:33:91:04:f1:bf:1a:b4: 
                    7a:c8:39:c2:89:1f:87:0f:91:19:81:09:46:0c:86: 
                    08:d8:75:c4:6f:5a:98:4a:f9:f8:f7:38:24:fc:bd: 
                    94:24:37:ab:f1:1c:d8:91:ee:fb:1b:9f:88:ba:25: 
                    da:f6:21:7f:04:32:35:17:3d:36:1c:fb:b7:32:9e: 
                    42:af:77:b6:25:1c:59:69:af:be:00:a1:f8:b0:1a: 
                    6c:14:e2:ae:62:e7:6b:30:e9 
                Exponent: 65537 (0x10001) 
         X509v3 extensions: 
             X509v3 Basic Constraints: 
                 CA:FALSE 
             Netscape Comment: 
                 OpenSSL Generated Certificate
             X509v3 Subject Key Identifier:
                 FE:04:46:ED:A0:15:BE:C1:4B:59:03:F8:2D:0D:ED:2A:E0:ED:F9:2F 
             X509v3 Authority Key Identifier:
                 keyid:E6:12:7C:3D:A1:02:E5:BA:1F:DA:9E:37:BE:E3:45:3E:9B:AE:E5:A6 
                 DirName:/C=FJ/ST=Fiji/L=Suva/O=SOPAC/OU=ICT/CN=SOPAC Root CA/Email=administrator@sopac.org 
                 serial:00
    Signature Algorithm: md5WithRSAEncryption
        34:8d:fb:65:0b:85:5b:e2:44:09:f0:55:31:3b:29:2b:f4:fd: 
        aa:5f:db:b8:11:1a:c6:ab:33:67:59:c1:04:de:34:df:08:57: 
        2e:c6:60:dc:f7:d4:e2:f1:73:97:57:23:50:02:63:fc:78:96: 
        34:b3:ca:c4:1b:c5:4c:c8:16:69:bb:9c:4a:7e:00:19:48:62: 
        e2:51:ab:3a:fa:fd:88:cd:e0:9d:ef:67:50:da:fe:4b:13:c5: 
        0c:8c:fc:ad:6e:b5:ee:40:e3:fd:34:10:9f:ad:34:bd:db:06: 
        ed:09:3d:f2:a6:81:22:63:16:dc:ae:33:0c:70:fd:0a:6c:af:
        bc:5a 
-----BEGIN CERTIFICATE----- 
MIIDoTCCAwqgAwIBAgIBATANBgkqhkiG9w0BAQQFADCBiTELMAkGA1UEBhMCRkox 
DTALBgNVBAgTBEZpamkxDTALBgNVBAcTBFN1dmExDjAMBgNVBAoTBVNPUEFDMQww 
CgYDVQQLEwNJQ1QxFjAUBgNVBAMTDVNPUEFDIFJvb3QgQ0ExJjAkBgkqhkiG9w0B 
CQEWF2FkbWluaXN0cmF0b3JAc29wYWMub3JnMB4XDTAxMTEyMDA1NDc0NFoXDTAy 
MTEyMDA1NDc0NFowgYkxCzAJBgNVBAYTAkZKMQ0wCwYDVQQIEwRGaWppMQ0wCwYD 
VQQHEwRTdXZhMQ4wDAYDVQQKEwVTT1BBQzEMMAoGA1UECxMDSUNUMRYwFAYDVQQD 
Ew13d3cuc29wYWMub3JnMSYwJAYJKoZIhvcNAQkBFhdhZG1pbmlzdHJhdG9yQHNv 
cGFjLm9yZzCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAulQsq4h0qms1panB 
0Fqb+2u1cbzv06sVzFt1cza4AdFZP8GIwDORBPG/GrR6yDnCiR+HD5EZgQlGDIYI 
2HXEb1qYSvn49zgk/L2UJDer8RzYke77G5+IuiXa9iF/BDI1Fz02HPu3Mp5Cr3e2 
JRxZaa++AKH4sBpsFOKuYudrMOkCAwEAAaOCARUwggERMAkGA1UdEwQCMAAwLAYJ 
YIZIAYb4QgENBB8WHU9wZW5TU0wgR2VuZXJhdGVkIENlcnRpZmljYXRlMB0GA1Ud
DgQWBBT+BEbtoBW+wUtZA/gtDe0q4O35LzCBtgYDVR0jBIGuMIGrgBTmEnw9oQLl 
uh/anje+40U+m67lpqGBj6SBjDCBiTELMAkGA1UEBhMCRkoxDTALBgNVBAgTBEZp 
amkxDTALBgNVBAcTBFN1dmExDjAMBgNVBAoTBVNPUEFDMQwwCgYDVQQLEwNJQ1Qx 
FjAUBgNVBAMTDVNPUEFDIFJvb3QgQ0ExJjAkBgkqhkiG9w0BCQEWF2FkbWluaXN0 
cmF0b3JAc29wYWMub3JnggEAMA0GCSqGSIb3DQEBBAUAA4GBADSN+2ULhVviRAnw 
VTE7KSv0/apf27gRGsarM2dZwQTeNN8IVy7GYNz31OLxc5dXI1ACY/x4ljSzysQb 
xUzIFmm7nEp+ABlIYuJRqzr6/YjN4J3vZ1Da/ksTxQyM/K1ute5A4/00EJ+tNL3b 
Bu0JPfKmgSJjFtyuMwxw/Qpsr7xa
-----END CERTIFICATE-----
```


### load a certificate from windows certificate store

```csharp
static void Main(string[] args)
{
    X509Certificate2 cer = new X509Certificate2();
    cer.Import(@"D:\l.cer");
    X509Store store = new X509Store(StoreLocation.CurrentUser);
    store.Certificates.Add(cer);

     X509Certificate2Collection cers = store.Certificates.Find(X509FindType.FindBySubjectName, "My Cert's Subject Name", false);
    if (cers.Count>0)
    {
        cer = cers[0];
    };
    store.Close();
}
```

## JWT

### signing and validating

With a private key, you sign the token - encrypt it. With the public key, you verify it, decrypting the token.

When a resource server is on https, the auth server issues the cookie against https. You cannot redirect the user back to http.

## Identity Server

* uris: https://localhost:44301/identity/.well-known/openid-configuration
