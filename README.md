# Toolbox Docker Image

A lightweight Alpine-based Docker image with essential tools for AWS, MongoDB, and PostgreSQL operations.

## Included Tools

- **AWS CLI** - Universal Command Line Interface for Amazon Web Services
- **MongoDB Tools** - Database tools for MongoDB operations
- **PostgreSQL Client** - Command-line tools for PostgreSQL
- **Additional utilities**: bash, curl, gnupg, tar, gzip

## Usage

```bash
# Run interactively
docker run -it your-dockerhub-username/toolbox

# Run with volume mount
docker run -it -v $(pwd):/workspace your-dockerhub-username/toolbox

# Run specific command
docker run --rm your-dockerhub-username/toolbox aws --version
```

## GitHub Actions Setup

This repository includes GitHub Actions workflow for automatic Docker image building and pushing to DockerHub.

### Required Secrets

To enable automatic builds, add these secrets to your GitHub repository:

1. Go to your repository → Settings → Secrets and variables → Actions
2. Add the following secrets:
   - `DOCKERHUB_USERNAME`: Your DockerHub username
   - `DOCKERHUB_TOKEN`: Your DockerHub access token (create at https://hub.docker.com/settings/security)

### Build Triggers

The workflow triggers on:

- **Push to main branch** → Builds and pushes `latest` tag
- **Push tags** (v\*) → Builds and pushes version tags (e.g., `v1.0.0`, `1.0`, `1`)
- **Pull requests** → Builds only (no push)

### Configuration

Add variable `IMAGE_NAME` in GitHub Actions workflow to specify the image name. Default is `toolbox`.

## Local Development

```bash
# Build locally
docker build -t toolbox .

# Test the image
docker run --rm toolbox aws --version
docker run --rm toolbox psql --version
docker run --rm toolbox mongodump --version
```

## Image Details

- **Base Image**: Alpine Linux 3
- **Size**: ~291MB
- **Platforms**: linux/amd64, linux/arm64
- **Working Directory**: `/home`

- **Git Commit Tracking**: Each image includes the source Git commit SHA in the `SRC_VERSION` environment variable

### Checking Image Version

```bash
# Check the Git commit that built the image
docker run --rm your-dockerhub-username/toolbox env | grep SRC_VERSION

# Or from within the container
echo $SRC_VERSION
```
