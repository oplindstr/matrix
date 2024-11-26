This is the repository of the student organization Matrix ry's website. Matrix ry is the student organization of mathematics students at the University of Helsinki.

Link to the website: https://matrix-ry.fi/

Test environment in Heroku: https://matrix-ry.herokuapp.com

Code Climate: [![Code Climate](https://codeclimate.com/github/oplindstr/matrix.png)](https://codeclimate.com/github/oplindstr/matrix)

## Running the app in Docker

* Download [Docker Desktop](https://www.docker.com/products/docker-desktop/)

* On Windows, the following steps may be needed for Docker to work. On Mac/Linux you can possibly skip these steps.
  * Enable Virtualization in BIOS:
    * Restart your computer and access the BIOS/UEFI firmware settings. This is typically done by pressing a key like DEL, F2, F10, or ESC during startup (check your motherboard's manual for details). Look for settings related to virtualization, such as:
      * Intel VT-x / Intel Virtualization Technology (for Intel processors).
      * AMD-V (for AMD processors).
    * Enable these options and save your changes. Then, reboot into Windows.
      * I had to hold F10, go to Security -> System Security -> Virtualization Technology: Enable

  * Enable Hyper-V:
    * Open Control Panel > Programs > Turn Windows features on or off. Check boxes that look like these:
      * Hyper-V.
      * Virtual Machine Platform.
      * Windows Hypervisor Platform.
    * Click OK and restart your computer.

  * Install WSL (Windows Subsystem for Linux)
    * Open PowerShell as Administrator and run:
      * wsl --install
      * wsl --set-default-version 2
     
When Docker (Desktop) has been successfully installed, you can build the docker image in the project root folder:
```
docker build -t matrix:1.0 .
```
Once the build finishes, you can run the application with:
```
docker run -p 3000:3000 matrix:1.0
```
Once the app is running, you can access it in browser in [localhost:3000](http://localhost:3000)

You can go inside the container in another terminal with:
```
docker exec -it <container_id> bash
```
Container ID can be found in Docker Desktop, or with "docker ps"

Once inside, you can open the database console with "rails c"
