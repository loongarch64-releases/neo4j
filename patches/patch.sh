#!/bin/bash

set -euo pipefail

SRC=$1

echo "patching..."

sed -i 's|<os-maven-plugin.version>.*</os-maven-plugin.version>|<os-maven-plugin.version>1.7.1</os-maven-plugin.version>|' "${SRC}/community/cypher-shell/cypher-shell/pom.xml"

sed -i 's/"aarch64"/"aarch64", "loongarch64"/' "${SRC}/community/unsafe/src/main/java/org/neo4j/internal/unsafe/UnsafeUtil.java"
sed -i '/"mips64".equals( value )/i \
        if ( "loongarch64".equals( value ) ) \
        { \
            return "loongarch_64"; \
        }' "${SRC}/community/cypher-shell/packaging/bin/create_native_image.java"

echo "done"
