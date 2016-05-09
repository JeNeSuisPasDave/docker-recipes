# This adds a private key to the running ssh-agent. This is done to avoid
# prompting for the passphrase with every git invocation that performs
# remote repository access.
#
& "C:\Program Files\Git\usr\bin\ssh-add.exe" "~/.ssh/github-datihein-rsa"
