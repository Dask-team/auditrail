#!/bin/bash

# Install Java
echo "Installing Java..."
sudo apt update
sudo apt install -y openjdk-11-jdk
java -version

# Add Elasticsearch GPG key
echo "Adding Elasticsearch GPG key..."
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# Add Elasticsearch repository
echo "Adding Elasticsearch repository..."
sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'

# Update package list
sudo apt update

# Install Elasticsearch
echo "Installing Elasticsearch..."
sudo apt install -y elasticsearch

# Enable and start Elasticsearch service
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service

# Install Kibana
echo "Installing Kibana..."
sudo apt install -y kibana

# Enable and start Kibana service
sudo systemctl enable kibana.service
sudo systemctl start kibana.service

# Install Logstash
echo "Installing Logstash..."
sudo apt install -y logstash

# Enable and start Logstash service
sudo systemctl enable logstash.service
sudo systemctl start logstash.service

echo "ELK Stack installation complete!"
