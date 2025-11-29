# Blackroad OS Pack · Research Lab (Gen-0)

This scaffold provides a lightweight research lab toolkit with experiments, notebooks, and agent helpers. Everything is plain text for portability.

## Quickstart
```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
python br_lab.py list
python br_lab.py run prime_factor_tree
python br_lab.py publish prime_factor_tree
```

## Layout
- `experiments/`: YAML metadata for experiments.
- `notebooks/`: Jupyter notebooks (text-only) used by agents.
- `agents/`: Python helpers for simulations and analyses.
- `lib/`: Shared utilities for data loading and plotting.
- `scripts/postbuild.py`: Writes `public/sig.beacon.json` during publish.
- `br_lab.py`: CLI entry point for listing, running, and publishing experiments.

## Notes
- Keep notebooks under 200 KB and avoid binary assets.
- Base64-encoded PNG strings are embedded directly into notebooks when needed.
- Future work: dataset registry, peer-review bot, LaTeX export (`# TODO(lab-pack-next)`).
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
