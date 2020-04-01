
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
 "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
 $(lsb_release -cs) \
 stable"

sudo apt-get update -y

# builders
sudo apt-get install -y \
  make \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libncurses5-dev \
  libncursesw5-dev \
  llvm \
  xz-utils \
  tk-dev

# tools
sudo apt-get install -y \
  zsh \
  wget \
  curl \
  unzip \
  git \
  tmux \
  expect \
  apt-transport-https \
  ca-certificates \
  gnupg-agent \
  software-properties-common \
  mysql-client \
  postgresql-client \
  sqlite3 \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  direnv \
  jq \

chsh -s $(which zsh)

sudo snap install bash-language-server
sudo snap install pyls

sudo timedatectl set-timezone Asia/Tokyo

sudo usermod -aG docker $USER

set -x
git clone https://github.com/anyenv/anyenv ~/.anyenv
expect -c "
  spawn ~/.anyenv/bin/anyenv install --init
  expect {
    default { exit 0 }
    \"y/N\" { send \"y\n\" }
  }
  interact
"

