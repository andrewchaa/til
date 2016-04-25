# resources

* editing config.plist http://www.tonymacx86.com/basics/174320-how-edit-clover-config-plist.html
* http://themacadmin.com/mounting-the-efi-boot-partition-on-mac-os-x/

**Hardware Specs**

* Processor: 32 GHz Intel Core i5
* Memory 16 GB 1333 MHz DDR3
* Graphics: Intel HD Graphics 4600 1536 MB
* Realtek ALC887 Codec
* Motherboard: GA-Z97-HD3

**Intel HD Graphics on El Capitan**

Before editing plist file, make sure you have an editor. Install XCode

http://www.tonymacx86.com/el-capitan-laptop-support/175797-fix-hd4200-hd4400-hd4600-hd5600-10-11-a.html

OS X supports a range of Intel HD Graphics devices, however not all the variants present in hackintosh devices are supported out of the box.

Haswell HD4200/HD4400/HD4600: Must inject device-id=0x0412.
config.plist/Devices/FakeID/IntelGFX=0x04128086

**Mounting the EFI partition at the efi mount point**

```
diskutil list

/dev/disk0
 #: TYPE                     NAME          SIZE       IDENTIFIER
 0: GUID_partition_scheme                  *251.0 GB  disk0
 1: EFI                                    209.7 MB   disk0s1
 2: Apple_HFS                Macintosh HD  250.1 GB   disk0s2
 3: Apple_Boot               Recovery HD   650.0 MB   disk0s3
 
 mkdir /Volumes/efi
 
 sudo mount -t msdos /dev/disk0s1 /Volumes/efi
```

**Install Realtek ACL 887 audio**

http://www.tonymacx86.com/audio/143757-audio-realtek-alc-applehda-guide.html#post886744

* Run Multibeast
* Drivers > Audio > Realtek 887/888b (Not legacy)
* Select Optional HD 4600 HDMI Audio/Desktop
* untick "Wake for network access"


**Display not working after sleep and wake**

* On BIOS, make graphics active always
* On Multibeast, install FakeSMC, FakeSMC Plugins, FakeSMC HWMOnitor Application and NullCPUPowerManagement


**RealTec audio not working after sleep and wake**

* Download Kextbeast: http://www.tonymacx86.com/downloads.php?do=file&id=32
* Install the ready-made kext: http://www.tonymacx86.com/audio/170063-fix-no-sound-after-sleep-1150-possibly-other-realteks.html
