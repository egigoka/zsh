#!/bin/bash

if [ -f /etc/debian_version ] || grep -q 'ID_LIKE.*debian' /etc/os-release 2>/dev/null; then
    echo "Installing dependencies for Debian/Ubuntu-based systems..."
    sudo apt-get update
    sudo apt-get install -y git autoconf yodl libncurses-dev texinfo
elif [ -f /etc/fedora-release ] || grep -q 'ID.*fedora' /etc/os-release 2>/dev/null; then
    echo "Installing dependencies for Fedora..."
    sudo dnf install -y git autoconf yodl ncurses-devel texinfo
elif [ -f /etc/redhat-release ] || grep -q 'ID_LIKE.*rhel' /etc/os-release 2>/dev/null; then
    echo "Installing dependencies for RHEL/CentOS..."
    sudo dnf install -y git autoconf yodl ncurses-devel texinfo 2>/dev/null || sudo yum install -y git autoconf yodl ncurses-devel texinfo
elif [ -f /etc/arch-release ] || grep -q 'ID.*arch' /etc/os-release 2>/dev/null; then
    echo "Installing dependencies for Arch Linux..."
    sudo pacman -Sy --noconfirm git autoconf yodl ncurses texinfo
elif [ -f /etc/SuSE-release ] || [ -f /etc/opensuse-release ] || grep -q 'ID.*suse' /etc/os-release 2>/dev/null; then
    echo "Installing dependencies for openSUSE..."
    zypper addrepo https://download.opensuse.org/repositories/Publishing/openSUSE_Factory/Publishing.repo
    zypper refresh
    sudo zypper install -y git autoconf yodl ncurses-devel texinfo
elif command -v brew >/dev/null 2>&1; then
    echo "Installing dependencies for macOS..."
    brew install autoconf yodl ncurses texinfo git
else
    echo "Could not detect your OS. Please install these packages manually: git autoconf yodl libncurses-dev/ncurses-devel texinfo"
    exit 1
fi

