from pathlib import Path

import pandas as pd
import yaml


def load_responses(responses_dir: Path) -> pd.DataFrame:
    """Read every response file in `responses_dir` into one dataframe, one row per entry."""
    response_files = sorted(p for p in responses_dir.glob("*.yml") if p.stem != "_blank")  # _blank.yml is a template

    entries = []
    for path in response_files:
        with path.open(encoding="utf-8") as f:
            entries.extend(yaml.safe_load(f))

    print(f"Read {len(entries):,} entries from {len(response_files)} files")

    return pd.DataFrame(entries)
