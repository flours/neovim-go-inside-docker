FROM ubuntu:23.04

RUN apt-get update
RUN apt-get install -y build-essential libbz2-dev libdb-dev \
  libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
  libncursesw5-dev libsqlite3-dev libssl-dev \
  zlib1g-dev uuid-dev tk-dev git python3-full python3-pip \
  wget 
RUN python3 -m pip install --break-system-packages pynvim

RUN  apt-get update \
  && apt-get install -y neovim \
  && apt-get install -y curl \
  && apt-get install -y gfortran libopenblas-dev \
  && apt-get install -y libgeos-dev

RUN wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim.appimage \
&& chmod u+x nvim.appimage \
&& ./nvim.appimage --appimage-extract \
&& cp ./squashfs-root/usr/bin/nvim /usr/bin/vim \
&& rm -rf nvim.appimage squashfs

WORKDIR /root

RUN  curl -sL install-node.now.sh/lts >install.sh \
&& chmod +x install.sh \
&& ./install.sh --yes \
&& rm install.sh

COPY bash/.bashrc .bashrc
COPY bash/.bash_profile .bash_profile

# install golang
RUN git clone https://github.com/go-nv/goenv.git ~/.goenv
RUN bash -l -c "goenv install 1.21.3 && goenv global 1.21.3"
RUN git clone https://github.com/akinomyoga/cxxmatrix.git && cd cxxmatrix && make && mv cxxmatrix /usr/local/bin && cd ../ && rm -rf cxxmatrix

COPY vim/init.vim /root/.config/nvim/init.vim
COPY vim/plugins/dein.toml /root/.config/nvim/plugins/dein.toml
COPY vim/plugins/coc.rc.vim /root/.config/nvim/plugins/coc.rc.vim

RUN nvim +"call dein#install()" +qall
RUN vim -c 'CocInstall -sync coc-json coc-go|q' || true

CMD ["bash","-l"]
