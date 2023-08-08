install_pip() {
    if ! command -v pip3 >/dev/null; then
        echo "Installing pip..."
        # Detect the operating system and install pip based on the OS
        # You can modify this section with the appropriate package manager commands for your Unix distribution.
        if [[ "$(uname)" == "Linux" ]]; then
            if command -v apt-get >/dev/null; then
                sudo apt-get update
                sudo apt-get install -y python3-pip
            elif command -v yum >/dev/null; then
                sudo yum install -y python3-pip
            elif command -v dnf >/dev/null; then
                sudo dnf install -y python3-pip
            elif command -v pacman >/dev/null; then
                sudo pacman -S python-pip
            elif command -v zypper >/dev/null; then
                sudo zypper install -y python3-pip
            else
                echo "Package manager not found. Please install pip manually."
                exit 1
            fi
        elif [[ "$(uname)" == "Darwin" ]]; then
            if command -v brew >/dev/null; then
                brew install python
            else
                echo "Homebrew not found. Please install pip manually."
                exit 1
            fi
        elif [[ "$(uname)" == "FreeBSD" ]]; then
            sudo pkg install -y py38-pip
        elif [[ "$(uname)" == "OpenBSD" ]]; then
            doas pkg_add py3-pip
        elif [[ "$(uname)" == "NetBSD" ]]; then
            pkgin install py39-pip
        else
            echo "Unsupported operating system. Please install pip manually."
            exit 1
        fi
    fi
}

install_go() {
    if ! command -v go >/dev/null; then
        # Detect the operating system and install Go based on the OS
        # You can modify this section with the appropriate package manager commands for your Unix distribution.
        if [[ "$(uname)" == "Linux" ]]; then
            if command -v apt-get >/dev/null; then
                sudo apt-get update
                sudo apt-get install -y golang
            elif command -v yum >/dev/null; then
                sudo yum install -y golang
            elif command -v dnf >/dev/null; then
                sudo dnf install -y golang
            elif command -v pacman >/dev/null; then
                sudo pacman -S go
            elif command -v zypper >/dev/null; then
                sudo zypper install -y go
            else
                echo "Package manager not found. Please install Go manually."
                exit 1
            fi
        elif [[ "$(uname)" == "Darwin" ]]; then
            if command -v brew >/dev/null; then
                brew install go
            else
                echo "Homebrew not found. Please install Go manually."
                exit 1
            fi
        elif [[ "$(uname)" == "FreeBSD" ]]; then
            sudo pkg install -y go
        elif [[ "$(uname)" == "OpenBSD" ]]; then
            doas pkg_add go
        elif [[ "$(uname)" == "NetBSD" ]]; then
            pkgin install go
        else
            echo "Unsupported operating system. Please install Go manually."
            exit 1
        fi
    fi
}

install_perl() {
    if ! command -v perl >/dev/null; then
        # Detect the operating system and install Perl based on the OS
        # You can modify this section with the appropriate package manager commands for your Unix distribution.
        if [[ "$(uname)" == "Linux" ]]; then
            if command -v apt-get >/dev/null; then
                sudo apt-get update
                sudo apt-get install -y perl
            elif command -v yum >/dev/null; then
                sudo yum install -y perl
            elif command -v dnf >/dev/null; then
                sudo dnf install -y perl
            elif command -v pacman >/dev/null; then
                sudo pacman -S perl --noconfirm
            elif command -v zypper >/dev/null; then
                sudo zypper install -y perl
            else
                echo "Package manager not found. Please install Perl manually."
                exit 1
            fi
        elif [[ "$(uname)" == "Darwin" ]]; then
            if command -v brew >/dev/null; then
                brew install perl
            else
                echo "Homebrew not found. Please install Perl manually."
                exit 1
            fi
        elif [[ "$(uname)" == "FreeBSD" ]]; then
            sudo pkg install -y perl
        elif [[ "$(uname)" == "OpenBSD" ]]; then
            doas pkg_add perl
        elif [[ "$(uname)" == "NetBSD" ]]; then
            pkgin install perl
        else
            echo "Unsupported operating system. Please install Perl manually."
            exit 1
        fi
    fi
}

intall_tools() {
if [ "$(uname)" == "Linux" ]; then
  distro=$(lsb_release -si)
  case $distro in
    "Ubuntu" | "Debian")
      apt-get install -y perl-Module-CoreList-tools
      ;;
    "CentOS" | "RHEL")
      yum install -y perl-Module-CoreList-tools
      ;;
    "Arch")
      pacman -S perl-Module-CoreList-tools
      ;;
    *)
      echo "Unsupported Linux distro: $distro"
      exit 1
      ;;
  esac
fi
}

cpan -i 

cpan JSON