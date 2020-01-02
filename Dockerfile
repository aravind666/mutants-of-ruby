FROM ruby:2.5.3

# We need some editor to do some basic activity inside container
RUN apt-get update
RUN apt-get -y install vim 

ENV NVM_DIR /usr/local/nvm
RUN mkdir $NVM_DIR
RUN chmod a+x $NVM_DIR

ENV NODE_VERSION 12.13.1

# Install nvm with node and npm 
# This is simpler than relying on apt or yum 
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
RUN npm install -g jscpd@2.0.16