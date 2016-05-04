# Creating a new VM to host Docker Server

This command will create a new Linux VM that runs the Docker Server. The VM will have 2 cores and 4GB RAM with a main disk sized at 20GB.

```powershell
docker-machine.exe create --driver hyperv --hyperv-virtual-switch "External Virutal Switch" --hyperv-cpu-count 2 --hyperv-memory "4096" --hyperv-disk-size "20000" heind-dkr2
```

When I run that command I see this output:

```nohighlight
Running pre-create checks...
Creating machine...
(heind-dkr2) Copying C:\Users\heind\.docker\machine\cache\boot2docker.iso to C:\Users\heind\.docker\machine\machines\heind-dkr2\boot2docker.iso...
(heind-dkr2) Creating SSH key...
(heind-dkr2) Creating VM...
(heind-dkr2) Using switch "External Virtual Switch"
(heind-dkr2) Creating VHD
(heind-dkr2) Starting VM...
(heind-dkr2) Waiting for host to start...
Waiting for machine to be running, this may take a few minutes...
Detecting operating system of created instance...
Waiting for SSH to be available...
Detecting the provisioner...
Provisioning with boot2docker...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
Checking connection to Docker...
Docker is up and running!
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: C:\Program Files\Docker Toolbox\docker-machine.exe env heind-dkr2
```

Running the command: `docker-machine.exe env heind-dkr2` yields:

```nohighlight
$Env:DOCKER_TLS_VERIFY = "1"
$Env:DOCKER_HOST = "tcp://10.32.150.71:2376"
$Env:DOCKER_CERT_PATH = "C:\Users\heind\.docker\machine\machines\heind-dkr2"
$Env:DOCKER_MACHINE_NAME = "heind-dkr2"
# Run this command to configure your shell:
# & "C:\Program Files\Docker Toolbox\docker-machine.exe" env heind-dkr2 | Invoke-Expression
```

So I set the environment and list the docker machines:

```powershell
& docker-machine.exe env heind-dkr2 | Invoke-Expression
docker-machine ls
```

And that returns:

```nohighlight
NAME         ACTIVE   DRIVER   STATE     URL                       SWARM   DOCKER    ERRORS
heind-dkr2   *        hyperv   Running   tcp://10.32.150.71:2376           v1.11.1
```

Now try some docker commands:

```nohighlight
> docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
> docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

No images or containers, as expected for a new VM.

Use PuTTY to SSH to the machine and confirm the version of docker and that there are no containers or images.

That's it!
