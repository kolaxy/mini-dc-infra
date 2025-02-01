### jellyfin
```
services:
  jellyfin:
    image: jellyfin/jellyfin
    container_name: jellyfin
    user: 1000:1000
    volumes:
      - ./config:/config
      - ./cache:/cache
      - type: bind
        source: ./media
        target: /media
      - type: bind
        source: ./media2
        target: /media2
        read_only: true
      # Optional - extra fonts to be used during transcoding with subtitle burn-in
    restart: 'unless-stopped'
    # Optional - alternative address used for autodiscovery
    environment:
      - JELLYFIN_PublishedServerUrl=http://test.lan
    # Optional - may be necessary for docker healthcheck to pass if running in host network mode
    ports:
      - "8096:8096"   # Web UI (HTTP)
      - "8920:8920"   # Web UI (HTTPS) (requires SSL setup)
      - "7359:7359/udp"  # Auto-discovery
      - "1900:1900/udp"  # DLNA discovery
```

### transmission
