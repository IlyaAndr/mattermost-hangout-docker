FROM node:latest

RUN mkdir -p /usr/src/hangout
WORKDIR /usr/src/hangout

# Create User
RUN groupadd -r app && useradd -r -g app app

# Glone git
RUN git clone -b master https://github.com/chitter99/mattermost-hangout.git /usr/src/hangout/
RUN chown app:app -R /usr/src/hangout/

# Load all requirements
RUN npm install

USER app
CMD ["npm", "start"]

EXPOSE 5000
