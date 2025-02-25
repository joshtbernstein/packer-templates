# About
A collection of [Packer](https://packer.io) templates used to create VM templates in [VMware](https://vmware.com) vSphere.

The goal is to create master/gold image VM templates containing the latest OS updates, while making minimal changes to the installed OS.

# Setup
## Packer
Run `packer init templates` to install the third party Packer Windows Update Provisioner(https://github.com/rgl/packer-plugin-windows-update) plugin. This only needs to be done once.

## Change Administrator Password (Optional)
The Administrator password is reset by Sysprep, but if you'd like to change the password that's used while building the VM templates, update the autounattend.xml files in the answer_files directory. There are two lines that needed to be changed; one sets the password and the other sets the password for use with automatic login.

You'll also need to update the `os-admin-password` variable in templates/windows-vsphere.json

It's probably more appropriate to update the unattend.xml answer files as those will set the password for cloned VMs.

## Environment Settings
Copy templates/vsphere.example.json to templates/vsphere.json and update the [variables](https://packer.io/plugins/builders/vsphere/vsphere-iso) to match your environment.

# Usage
To build a Window Server 2019 template VM, run `packer build -var-file=templates/vsphere.json -var-file=templates/windows-server-2019.json templates/windows-vsphere.json`.

To build Window Server 2019 Core template VM, run `packer build -var-file=templates/vsphere.json -var-file=templates/windows-server-2019core.json templates/windows-vsphere.json`.

# Links

## Eval ISO Links
* [Windows 10](https://www.microsoft.com/en-us/evalcenter/download-windows-10-enterprise)
* [Windows 11](https://www.microsoft.com/en-us/evalcenter/download-windows-11-enterprise)
* [Server 2019](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)
* [Server 2022](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2022)
* [Server 2025](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2025)

## Other Links
* [List](https://knowledge.broadcom.com/external/article/321876/determine-the-guest-os-from-a-vm-configu.html) of Guest OS ID values (guest_os_type)
* [Convert an evaluation version to a retail version](https://learn.microsoft.com/en-us/windows-server/get-started/upgrade-conversion-options#convert-an-evaluation-version-to-a-retail-version)

# Contributing
Issues (or suggestions and questions) and PRs are welcome!
