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
