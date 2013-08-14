**Work in progress for the LG Motion 4G.

**Thanks to:

    hroark13 for posting his device repo.

	BobZhome for his time & work on this project.



HOW-TO BUILD:
=============

**This short guide assumes you're on Ubuntu 11.04 or above**

Getting the (right) source
--------------------------

First, we need to create directories for the build (aokp can be whatever you want to name your working directory):

    $ mkdir -p ~/bin

    $ mkdir -p ~/android/aokp

Now we'll need repo. Let's download it and make it executable (If you have already done this before with CM, skip):

    $ curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo

    $ chmod a+x ~/bin/repo

Log out and back in so the changes take effect.

Now initialized the repository and pull the source (with my repos attached):

    $ cd ~/android/aokp/
    
    $ repo init -u https://github.com/AOKP/platform_manifest.git -b jb
    
    $ repo sync

Note: Depending on your connection, this might take awhile.

Getting my repos for the LG Motion (l0)
	
	$ cd ~/android/system/device/

	$ mkdir lge

	$ cd lge

	$ git clone https://github.com/sammyz/android_device_lge_l0.git -b aokp l0


Getting kernel source
---------------------

Then cd to the kernel directory (custom kernels unable to be used at this time due to locked bootloader, but setup for them just in case):

	$ mkdir ~/android/system/kernel (if it doesnt exist already!)

	$ cd ~/android/system/kernel

	$ mkdir lge

	$ cd ~/android/system/kernel/lge

	$ git clone https://github.com/playfulgod/kernel_lge_l0.git l0

Extract necessary binaries and proprietary files 
------------------------------------------------

We will need to reuse some proprietary files from the stock ROM:

    $ cd
    
    $ cd ~/android/aokp/device/lge/l0
    
    $ ./extract-files.sh

or place a copy of a stock ROM zip or previous CM/AOKP build in device/lge/l0

	$ ./unzip-files.sh name-of-zip.zip

Building AOKP
-------------

Now, we build (system being your work directory):

    $ cd ~/android/aokp

To build for the LG Motion 4G:
    
    $ . build/envsetup.sh && brunch l0


Installing AOKP
---------------
If the build was successful, you can now take the update zip found in out/target/product/l0/ and flash using a custom recovery. Make sure to grab the latest Gapps to complete the experience.

Note: Currently the produced zip will need to be edited and repack with the stock boot.img or the boot.img removed and the updater-script edited accordingly.

When you want to rebuild with new changes to the BoardConfig.mk or after syncing to the latest CM src make sure to do the following before you recompile.

    $ make clobber



