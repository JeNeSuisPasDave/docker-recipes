# Creating a data drive for Docker data volumes

## Adding a new VMDK to hold persistent data (VirtualBox)

This scenario is for Hyper-V boot2docker VMs.

We have a boot2docker VM with a 20GB disk; initially 17GB is free. We want to have a persistent space for Docker containers and want to be able to grow larger than 20GB. So, we'll add another disk to the system.

### Creating the VMDK (VirtualBox)

To create the data VMDK and format it, follow these steps.

1. Shutdown the VM.
2. Create a new dynamic VMDK called `dkr-data.vmdx` attached to the SATA controller of the VirtualBox Hyper-V boot2docker VM.
2. Start the VM
2. SSH to the VM using `docker-machine ssh`
3. In my case the new disk was assiged to `/dev/sdb`.
4. Create a partition on the new disk using `sudo fdisk /dev/sdb`.
    * Select command `n` to create a new partition,
    * command `e` to make it an extended partition,
    * `1` for the first partition, *
    * take the default start and end cylinder,
    * `n` to create a new partition (again),
    * `l` to create a logical partition,
    * take the default start and end cylinder,
    * and `w` to write the partition table.
5. Run `sudo fdisk /dev/sdb` again and use command `p` to print the partition table. In my case I see the logical partition assigned as `/dev/sdb5`.
5. Create the `ext4` filesystem on the disk: `sudo mkfs.ext4 -L boot2docker-data /dev/sdb5`

### Mounting and mapping the VMDK (VirtualBox)

To make sure the VM mounts the disk on boot, and to map the persistent store to `/var/lib/dockerdata`, follow these steps:

1. `cd /var/lib/boot2docker` (because this directory is symlinked to the primary persistent store for the VM)
2. `sudo vi bootlocal.sh`[^bootlocal] and put this in the file:

```bash
#! /bin/sh
#

# mount the data volume
#
mount -t ext4 /dev/sdb5 /mnt/sdb5

# link to /var/lib/dockerdata
#
ln -s /mnt/sdb5 /var/lib/dockerdata
```

[^bootlocal]: (Note: I found out about `bootlocal.sh` here: [http://stackoverflow.com/questions/26639968/boot2docker-startup-script-to-mount-local-shared-folder-with-host][http://stackoverflow.com/questions/26639968/boot2docker-startup-script-to-mount-local-shared-folder-with-host]. See `/opt/bootscript.sh` to see how and when `bootlocal.sh` gets invoked.)

## Adding a new VHD to hold persistent data (Hyper-V)

This scenario is for Hyper-V boot2docker VMs.

We have a boot2docker VM with a 20GB disk; initially 17GB is free. We want to have a persistent space for Docker containers and want to be able to grow larger than 20GB. So, we'll add another disk to the system.

### Creating the VHD

This has a couple steps. First is to create a dynamically expanding VHD and attach it to the boot2docker VM and format it. Second is to create a second VHD that is a differencing disk with the first as the base. This way if we want to create additional Linux formatted VHDs we don't have to go through the formatting step.

These steps are based on a blog post by Chris Swan called ["Boot2Docker on HyperV"][swan].

[swan]: http://blog.thestateofme.com/2014/02/18/boot2docker-on-hyper-v/

To create the base VHD and format it, follow these steps.

1. Shutdown the VM.
2. Create a new dynamic VHD called dkr-base.vhd attached to one of the IDE controllers on the Hyper-V boot2docker VM.
2. Start the VM
2. Use PuTTY to `ssh` to the VM
3. In my case I added the disk to the second IDE controller and so the device was `/dev/sdb`.
4. Create a partition on the new disk using `sudo fdisk /dev/sdb`. Select command `n` to create a new partition, command `e` to make it an extended partition, `1` for the first partition, take the default start and end cylinder, `n` to create a new partition, `l` to create a logical partition, take the default start and end cylinder, and `w` to write the partition table.
5. Create the `ext4` filesystem on the disk: `sudo mkfs.ext4 -L boot2docker-data /dev/sdb5`

To create the data VHD (as a differencing disk), follow these steps:

1. Shutdown the VM
2. Detach the new disk
3. Create a new differencing VHD called dkr-data.vhd with dkr-base.vhd as the base for differencing. Attach it to the same IDE controller.
4. Start the VM
5. Use PuTTY to `ssh` to the VM
6. Mount the driving using `sudo mount -t ext4 /dev/sdb5 /mnt/sdb5`

To make sure the VM mounts the disk on boot, follow these steps:

1. `cd /var/lib/boot2docker` (because this directory is symlinked to the primary persistent store for the VM)
2. `vi bootlocal.sh` and put this in the file:

```bash
#! /bin/sh
#

# mount the data volume
#
mount -t ext4 /dev/sdb5 /mnt/sdb5
```

(Note: I found out about `bootlocal.sh` here: [http://stackoverflow.com/questions/26639968/boot2docker-startup-script-to-mount-local-shared-folder-with-host][http://stackoverflow.com/questions/26639968/boot2docker-startup-script-to-mount-local-shared-folder-with-host]. See `/opt/bootscript.sh` to see how and when `bootlocal.sh` gets invoked.)

To add a data volume to a container that uses the new data volume, do something like this with the `-v` flag on the `docker run` command:

```powershell
& docker run -d -p 9292:9292 `
  -v /mnt/sdb5/geminabox/data:/usr/src/app/data `
  datihein/geminabox:v0.13.1
```

