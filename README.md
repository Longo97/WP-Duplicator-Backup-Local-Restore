# WP-Duplicator-Backup-Local-Restore
A script that lets you choose between two options:
* Automates the creation of a local WordPress server from scratch using Docker.
* Automates the creation of a local WordPress server based on a Duplicator backup using Docker.

# Prerequisites
Please make sure you have docker installed and running on your system.

# Usage
First, if you want to restore a Duplicator backup, you need to have downloaded the **zip file** and the **installer.php file** generated by **Duplicator** from your WordPress website. Once you've done that, clone this repository into the folder of your preference and place the Duplicator files inside the **'Source'** folder. <br/>
**WARNING:** Make sure that the installer file by Duplicator is named exactly **installer.php**<br/>
If you want to create a site from scratch, you don't need anything else.<br/><br/>
To start the script, run the command inside a terminal in the folder where you have cloned the repository, where the script is located:
```console
source start_script.sh
```
Now you have to follow the prompts inside the terminal. Once the server is up and running the page to install WordPress (or to restore the Duplicator backup) will open. <br/><br/>
If you are asked to connect to the database, the values that you need to insert are:
* **Host:** db
* **Database:** wordpress
* **User:** The user you choose inside the terminal (Default is **admin**)
* **Password:** The password you choose inside the terminal (Default is **admin**)

You can see an example in the following image:
<img width="922" alt="example-setup" src="https://github.com/Longo97/WP-Duplicator-Backup-Local-Restore/assets/57667688/086ce72e-5ff1-4e6a-a887-4412af848a50">
