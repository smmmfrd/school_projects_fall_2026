# ARM64 assembly dev environment: assembler/linker/debugger + GEF, ready to go.
# Build once, then run containers pointed at whatever project folder you like.

FROM --platform=linux/arm64 ubuntu:24.04

# Avoid interactive prompts during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Core toolchain:
#   binutils -> as, ld, readelf, nm
#   gcc      -> in case assignments link against libc
#   gdb      -> debugger
#   git      -> version control
#   vim      -> editor (optional, in case you want to edit inside the container)
#   file     -> required by GEF (was the earlier "Missing file `file`" error)
#   procps   -> provides `ps`, also required by GEF
#   python3  -> standalone python3 binary, also required by GEF's dependency check
#               (separate from gdb's embedded Python scripting support)
#   curl/wget-> for fetching GEF
#   locales  -> needed to generate a UTF-8 locale (fixes GEF's UnicodeEncodeError)
RUN apt-get update && apt-get install -y \
    binutils \
    gcc \
    gdb \
    git \
    vim \
    file \
    procps \
    python3 \
    curl \
    wget \
    locales \
    && rm -rf /var/lib/apt/lists/*

# Generate and set a UTF-8 locale so GEF's Unicode prompt characters don't crash
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Install GEF (GDB Enhanced Features) - Python-based GDB front-end
RUN wget -q -O /root/.gdbinit-gef.py https://gef.blah.cat/py && \
    echo "source /root/.gdbinit-gef.py" > /root/.gdbinit

# This is where you'll mount your project folder with -v
WORKDIR /workspace

CMD ["bash"]