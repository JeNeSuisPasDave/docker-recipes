FROM boot2docker/boot2docker

# Append indicator this is modified image
RUN echo "\nCustom boot2docker.iso\nAdded: bash\n" >> $ROOTFS/etc/motd

# Install readline, which is bash dependency
#
RUN curl -L -o /tmp/readline.tcz $TCL_REPO_BASE/tcz/readline.tcz && \
unsquashfs -f -d $ROOTFS /tmp/readline.tcz && \
rm -rf /tmp/readline.tcz

# Install bash
#
RUN curl -L -o /tmp/bash.tcz $TCL_REPO_BASE/tcz/bash.tcz && \
unsquashfs -f -d $ROOTFS /tmp/bash.tcz && \
rm -rf /tmp/bash.tcz

# Add bash completion
#
RUN curl -L -o /tmp/bash-completion.tcz $TCL_REPO_BASE/tcz/bash-completion.tcz && \
unsquashfs -f -d $ROOTFS /tmp/bash-completion.tcz && \
rm -rf /tmp/bash-completion.tcz

# Make bash a valid shell
#
RUN echo '/usr/local/bin/bash' | tee -a /etc/shells > /dev/null

# Set bash as the shell for userid 'docker'
# RUN sed -i '/^docker:/s#:[^:]\+$#:/usr/local/bin/bash#' /etc/passwd

# build the iso
RUN /make_iso.sh
CMD ["cat", "boot2docker.iso"]
