./Util/preconfig
./configure --prefix=/usr/local \
            --enable-etcdir=/etc/zsh \
            --enable-function-subdirs \
            --enable-site-fndir=/usr/local/share/zsh/site-functions \
            --enable-scriptdir=/usr/local/share/zsh/scripts \
            --with-tcsetpgrp
make
