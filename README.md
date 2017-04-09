# gnome-jenkins
Jenkins Pipeline for GNOME projects

## Prerequisites

1. Install docker-ce
1. Enable docker tcp socket following [this gist](https://gist.github.com/waltervargas/e72a3d207923ade03afd123b10b7c00e) 

## Steps

1. Build image
   ```
docker build -t waltervargas/gnome-jenkins . 
   ```
   
1. Run
   ```
docker run -p 8080:8080 -p 50000:50000 waltervargas/gnome-jenkins 
   ```
