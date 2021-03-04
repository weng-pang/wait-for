FROM node:14-alpine

# Install bash
RUN apk add --no-cache bash

# Create working directory
RUN mkdir -p /app
WORKDIR /app

# Install all Node dependencies
COPY package.json /app/
COPY package-lock.json /app/

RUN npm ci

# Copy source code
COPY . /app/
# Remove the spurious CR characters (for windows)
RUN sed -i -e 's/\r$//' ./wait-for

# Define default command
CMD npm test
