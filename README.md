# FIND_AMS_Deployment

## Table of contents
<!-- TOC -->
* [Pre-requisites](#pre-requisites)
* [Basic Installation Steps](#basic-installation-steps)
<!-- TOC -->
## Pre-requisites

For the installation process to run smoothly, ensure the following pre-conditions have been met. The installation script will check to ensure that all the pre-requisites have been met and will fail if one of them is not met.

- OS Architecture: **linux/amd64. Preferably Ubuntu 20.04LTS and above**
- **Docker and Docker Compose**. Instructions for installing on an Ubuntu OS can be found here
  
  Docker: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04
  Docker-compose (v2): https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04. 

- **NodeJS - minimum version 14**: Instructions for installing NodeJS on an Ubuntu OS can be found here https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04
- **Yarn**: Instructions for installing Yarn can be found here https://classic.yarnpkg.com/lang/en/docs/install
- **Unzip**: You need to have unzip installed on your system. `sudo apt install unzip`
- **Git**: Ensure git is installed on your system by running `git -v`. If not installed, install it by running `sudo apt install git`

<!-- TOC -->
## Basic Installation Steps

The basic installation process below will use default parameters to perform the following actions under the hood:
* Deploy DHIS2
* Deploy FIND-AMS Web Application

The steps are outlined below:

1. Clone the project repository

         git clone https://github.com/IntelliSOFT-Consulting/FIND_AMS_Deployment.git

2. cd into the project directory
         
         cd FIND_AMS_Deployment/ams

3. Countercheck the environment variables have been set correctly. They can be found here on the [.env](./.env) file.
  (Refer to the advanced installation steps in the next section for details about the environment variables.) 

4. Make the installation script executable

         sudo chmod 755 ./findams_script.sh

5. Run the installation script 

         sudo ./findams_script.sh

*The process will run for a few minutes.*

Once the process concludes, the application will be accessible via the http://localhost:8080 link

