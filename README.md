# blackroad-os-pack-research-lab

A standardized service for the BlackRoad OS ecosystem, optimized for Railway deployment.

## Purpose

The BlackRoad OS Pack Research Lab is a core service component that provides research and development capabilities for the BlackRoad OS ecosystem. This service is designed to integrate seamlessly with Railway's deployment infrastructure.

## Local Development

### Prerequisites

- Node.js >= 18.0.0
- npm

### Installation

```bash
npm install
```

### Running Locally

**Development mode (with auto-reload):**

```bash
npm run dev
```

**Production mode:**

```bash
npm run start:lab
```

The service will start on port `8080` by default (configurable via `PORT` environment variable).

## Deployment

This service is configured for Railway deployment using NIXPACKS.

### Railway Configuration

The `railway.toml` file defines:

- **Builder:** NIXPACKS
- **Start Command:** `npm run start:lab`
- **Health Check Path:** `/health`
- **Port:** 8080
- **Service Name:** `blackroad-os-pack-research-lab`

### Deploy to Railway

1. Connect your repository to Railway
2. Railway will automatically detect the `railway.toml` configuration
3. Deploy and the service will start on port 8080

## Healthcheck

The service exposes a health endpoint at `/health` that returns:

```json
{
  "status": "ok",
  "service": "blackroad-os-pack-research-lab",
  "timestamp": "2024-01-01T00:00:00.000Z"
}
```

### Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/` | GET | Service welcome message |
| `/health` | GET | Health check (200 OK) |

## File Structure

```
blackroad-os-pack-research-lab/
├── src/
│   ├── index.js          # Main entry point
│   └── routes/
│       └── health.js     # Health check route
├── package.json          # Dependencies and scripts
├── railway.toml          # Railway deployment config
└── README.md             # This file
```

## License

MIT