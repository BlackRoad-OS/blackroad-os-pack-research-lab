import json
import math
import sys
from typing import Dict, List

import numpy as np
from lib.data_loader import save_notebook_artifact


def simulate_factor_depth(n: int) -> List[int]:
    depths = []
    value = n
    while value > 1:
        for prime in range(2, int(math.sqrt(value)) + 1):
            if value % prime == 0:
                depths.append(prime)
                value //= prime
                break
        else:
            depths.append(value)
            break
    return depths


def build_summary(samples: int) -> Dict[str, float]:
    rng = np.random.default_rng(42)
    lengths = [len(simulate_factor_depth(int(x))) for x in rng.integers(50, 200, samples)]
    return {"mean_depth": float(np.mean(lengths)), "max_depth": float(np.max(lengths))}


def main(raw_cfg: str) -> None:
    cfg = json.loads(raw_cfg)
    summary = build_summary(samples=25)
    save_notebook_artifact(cfg["notebook"], {"summary": summary, "cfg": cfg})


if __name__ == "__main__":
    main(sys.argv[1])
