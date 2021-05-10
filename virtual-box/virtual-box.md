**Cannot register the DVD image '/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso'**

https://forums.virtualbox.org/viewtopic.php?f=8&t=51911

Failed to open virtual machine located in /Users/andrew/VirtualBox VMs/Win10/Win10.vbox.

Cannot register the DVD image '/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso' {6ef2a1f3-4741-4dad-9d3f-c2c08f6ce7aa} because a CD/DVD image '/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso' with UUID {586c1b9b-1988-49f0-b83a-761e6bd7d1f5} already exists.

Result Code: NS_ERROR_INVALID_ARG (0x80070057)
Component: VirtualBoxWrap
Interface: IVirtualBox {0169423f-46b4-cde9-91af-1e9d5b6cd945}

* This happens when the dvd image doesn't exist or a different image exist.
* Open the vbox in a text editor and removed the image in the tag. The file is in XML format.
