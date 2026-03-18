# alpine-envsubst

Minimal Docker image based on Alpine Linux with the `gettext` package (provides `envsubst`).

## Usage
### Docker
```bash
# Substituting environment variables in a template file
docker run -i ghcr.io/ourouk/alpine-envsubst < template.conf

# Subtiting from a template to a modified file
docker run -i ghcr.io/ourouk/alpine-envsubst < /config/config.template.json > /config/config.json

# Using a specific shell command
docker run -i ghcr.io/ourouk/alpine-envsubst 'echo $VAR'
```
### Docker compose
```yaml
services:
  crm-frontend-config:
    profiles : ["init"]
    image: ghcr.io/ourouk/alpine-envsubst:main
    env_file:
      - .env
    volumes:
      - ./crm-frontend-config:/config
    command: 
      - < /config/config.template.json > /config/config.json
```
## Environment Variables

Pass environment variables to the container to use in your templates:

```bash
docker run -i -e NAME=World ghcr.io/ourouk/alpine-envsubst 'Hello $NAME'
```

## Running Commands

The image can also execute arbitrary commands with envsubst available:

```bash
docker run -i ghcr.io/ourouk/alpine-envsubst sh -c 'echo $HOME'
```

## Image

Available on GitHub Container Registry: `ghcr.io/ourouk/alpine-envsubst`