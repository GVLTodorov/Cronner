# Cronner Docker Image with CRON functionality

## Predefined Folders

```1min, 15min, 30min, hourly, 12hour, daily, weekly, monthly```

## Docker Compose

```
version: '3.8'
services:  
  cronner:
    image: ghcr.io/gvltodorov/cronner:latest
    container_name: cronner
    restart: unless-stopped
    volumes:
       - /srv/cronner:/etc/cronner
```

Docker Image will populate folders mention in **Prefined Folders**
1. Go to your mapped folder (from example **/srv/cronner**) and choose folder 1min, 15min, 30min ... etc.
2. Create your bash script without extension like **script**.
3. Execute **sudo chmod+x script** so file can be executable.
