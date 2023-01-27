# Ludvig GitHub Action

See [Ludvig](https://github.com/frodehus/ludvig) for CLI usage and installation.

[![GitHub Release][release-img]][release]
[![GitHub Marketplace][marketplace-img]][marketplace]
[![License][license-img]][license]

Security scanner

## Usage

### CI pipeline

```yaml
name: "build"
on:
  push:
    branches:
      - main
    pull_request:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
      - name: Run Ludvig
        uses: FrodeHus/ludvig-action@v0.2.6
        with:
          path: "src/"
          level: "MEDIUM"
```
