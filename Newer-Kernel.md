# This is a guide for getting a newer kernel (NOT MAINLINE) on L4S ubuntu noble
## IF ANY OF THESE ARE CORRUPTED LINUX MAY NOT BOOT
Step 1: go [here](https://gitlab.com/l4t-community/gnu-linux/switchroot-pipeline/-/jobs?kind=BUILD) and navigate to the latest passed job (name should only be numbers) and download the latest artifacts
Step 2: Delete everything except for uImage, modules.tar.gz, and nx-plat.dtimg
Step 2: Insert your switch's micro sd card and navigate to /Switchroot/ubuntu-noble
Step 3: Copy over the files (replacing if prompted to)
Step 4: Reinsert your micro sd card back into the switch
