# Create a new Hyper-V virtual machine that hosts docker
# Machine name will be 'heind-dkr2'
#
docker-machine.exe create --driver hyperv `
  --hyperv-virtual-switch "External Virtual Switch" `
  --hyperv-cpu-count 2 --hyperv-memory "4096" `
  --hyperv-disk-size "20000" `
  heind-dkr2
