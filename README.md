# GitPullDocker
 Git pull private repos for docker on start

## Usage
Docker compose
```yaml
services:
  github:
    image: ghcr.io/wattlefoxxo/pullonstart
    volumes:
      - ./data:/root/data
    environment:
      - GIT_PRIVIDER=<YOUR PRIVDER>
      - GIT_REPO=<YOUR REPO>
      - GIT_KEY=<YOUR SSH PRIVATE KEY>
      - EXIT_WHEN_DONE=<true or false> # Optional
    restart: no
```

Example for github
```yaml
services:
  github:
    image: ghcr.io/wattlefoxxo/pullonstart
    volumes:
      - ./data:/root/data
    environment:
      - GIT_PRIVIDER="github.com"
      - GIT_REPO="git@github.com:WattleFoxxo/PullOnStart.git"
      - GIT_KEY="-----BEGIN OPENSSH PRIVATE KEY-----\n....REDACTED....n-----END OPENSSH PRIVATE KEY-----\n"
      - EXIT_WHEN_DONE=false
    restart: no
```
