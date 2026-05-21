#!/bin/bash
set -eou pipefail

UPSTREAM_OWNER=neo4j
UPSTREAM_REPO=neo4j

git ls-remote --tags --refs https://github.com/$UPSTREAM_OWNER/$UPSTREAM_REPO.git \
    | cut -d'/' -f3- \
    | cut -d'^' -f1 \
    | grep -E '^[0-9]{1,2}\.[0-9]+\.[0-9]+$' \
    | sort -V \
    | tail -n1
