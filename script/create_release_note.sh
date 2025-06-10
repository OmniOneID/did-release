#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <VERSION> <GITHUB_TOKEN>"
  echo "Example: $0 V2.0.0.0 ghp_XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  exit 1
fi

VERSION="$1"
TOKEN="$2"
OUTPUT_FILE="RELEASE-NOTE-${VERSION}.md"

REPO_PREFIX="OmniOneID"

REPOS=(
  "did-client-sdk-aos"
  "did-client-sdk-aos-kotlin"
  "did-client-sdk-ios"
  "did-blockchain-sdk-server"
  "did-cli-tool-server"
  "did-core-sdk-server"
  "did-crypto-sdk-server"
  "did-datamodel-server"
  "did-wallet-sdk-server"
  "did-zkp-sdk-server"
  "did-release"
  "did-common-sdk-server"
  "did-ca-aos"
  "did-ca-ios"
  "did-besu-contract"
  "did-issuer-server"
  "did-ta-server"
  "did-verifier-server"
  "did-api-server"
  "did-ca-server"
  "did-demo-server"
  "did-wallet-server"
  "did-demo-app"
  "did-orchestrator-server"
  "did-ledger-service-server"
)

echo "## Release Note $VERSION" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "| Repository         | Version         | Changelog                   | Release                     |" >> "$OUTPUT_FILE"
echo "| ------------------ | --------------- | --------------------------- | --------------------------- |" >> "$OUTPUT_FILE"


for REPO in "${REPOS[@]}"; do

  RELEASE_INFORM=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$REPO_PREFIX/$REPO/releases/latest)

    printf '%s\n' "$RELEASE_INFORM" | jq

    TAG_NAME=$(
        printf '%s\n' "$RELEASE_INFORM" |
        jq -r '.tag_name'
    )

  CHANGELOG_LINK="https://github.com/$REPO_PREFIX/$REPO/blob/main/CHANGELOG.md"
  RELEASE_LINK="https://github.com/$REPO_PREFIX/$REPO/releases"
    
  echo "| $REPO            | $TAG_NAME         | [Changelog]($CHANGELOG_LINK) | [Release]($RELEASE_LINK) |" >> "$OUTPUT_FILE"
done

echo "Output written to $OUTPUT_FILE"