FROM gitpod/workspace-full

# install aws-cli v2 and terraform
RUN   sudo sudo apt-get update \
      && sudo apt-get install -y gnupg software-properties-common curl \
      && curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
      && sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
      && sudo apt-get install terraform

    # Install terraform autocomplete
RUN   terraform -install-autocomplete

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Add alias to zshrc
RUN echo  '\n# Added by Thierry K. on 2024114\n' >> /home/gitpod/.zshrc

RUN echo  "alias ll='ls -alF'\nalias la='ls -A'\nalias l='ls -CF'\nalias tf='terraform'" >> /home/github/.zshrc

CMD ["zsh"]

    