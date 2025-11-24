import hashlib
import json
import sys
from typing import Dict, List

import numpy as np
from lib.data_loader import save_notebook_artifact


def sha_prefix_entropy(prefixes: List[str]) -> Dict[str, float]:
    bits = []
    for item in prefixes:
        digest = hashlib.sha256(item.encode()).hexdigest()
        bits.append(int(digest[:8], 16))
    arr = np.array(bits)
    return {"mean": float(np.mean(arr)), "std": float(np.std(arr))}


def main(raw_cfg: str) -> None:
    cfg = json.loads(raw_cfg)
    prefixes = [f"seed-{i}" for i in range(16)]
    stats = sha_prefix_entropy(prefixes)
    save_notebook_artifact(cfg["notebook"], {"stats": stats, "cfg": cfg})


if __name__ == "__main__":
    main(sys.argv[1])
