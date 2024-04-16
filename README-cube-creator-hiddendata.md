# Triplestore Benchmark

This uses [Iguana](https://github.com/dice-group/IGUANA) to benchmark triplestores.

## Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Java](https://www.java.com/en/)

## Quick Start

First, fetch Iguana by using the following command:

```sh
./scripts/fetch-iguana.sh
```

It will download Iguana from the specified GitHub release into the `iguana` directory.
The version is specified in the `scripts/fetch-iguana.sh` script.

Then, you can run the benchmark by using the following command:

```sh
./scripts/scenario-cube-creator-hiddendata.sh
```

This will run the benchmark scenario configured in `scenarios/cube-creator-hiddendata.yaml`.

The scripts for seting up the Stardog ACL respectively are in `datasets/cube-creator-hiddendata`.
