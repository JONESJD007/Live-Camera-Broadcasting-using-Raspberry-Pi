#!/bin/bash

# Live Camera Broadcasting using Raspberry Pi and MJPG-Streamer

echo "🔄 Updating system..."
sudo apt update -y

echo "📦 Installing dependencies..."
sudo apt install -y cmake git libjpeg8-dev imagemagick libv4l-dev

echo "📥 Cloning MJPG-Streamer repository..."
git clone https://github.com/jacksonliam/mjpg-streamer.git

cd mjpg-streamer/mjpg-streamer-experimental

echo "🔨 Building MJPG-Streamer..."
make
sudo make install

echo "📸 Starting MJPG-Streamer with Raspberry Pi Camera..."
./mjpg_streamer -i "./input_raspicam.so -x 640 -y 480 -fps 30" -o "./output_http.so -w ./www" &

echo "✅ MJPG-Streamer is running!"
echo "🌐 Visit http://<your_pi_ip>:8080 to view the live stream."
echo "To find your IP address, run: hostname -I"
