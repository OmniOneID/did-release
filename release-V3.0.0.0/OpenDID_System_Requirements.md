# OpenDID System Requirements — v3.0.0.0

These requirements cover the development and integration environment. Production sizing depends on traffic and deployment topology.

## Components

- Services: TA, Issuer, Verifier, API Gateway, CA, Wallet, Proxy, Demo, and Ledger Service when selected.
- Infrastructure: PostgreSQL and Hyperledger Besu, or the Ledger Service alternative supported by the server configuration.
- Orchestrator: optional local service controller. Proxy runs as a service and needs no entity wallet or DID.

## Host Requirements

| Item | Minimum / baseline | Recommended for local integration |
| --- | --- | --- |
| Operating system | Linux or macOS; Windows through WSL2 | Linux or macOS |
| CPU | 4 cores | 8 cores or more |
| Memory | 8 GB | 16 GB or more |
| Free disk space | 20 GB | 50 GB or more |
| Java | 21 | 21 |
| Gradle | Use each repository's wrapper | Use each repository's wrapper |
| Node.js | 22.12.0 for the Orchestrator admin build | 22.12.0 |
| Git | 2.30 or later | Current supported version |
| Docker | Required for the provided database and Besu setup | Current supported version |

The CPU, memory, and disk figures carry forward the v2 integration baseline; they have not been measured against a complete v3 deployment. Allocate extra resources for locally built JARs and concurrent services.

## Network Ports

The [Orchestrator configuration](https://github.com/OmniOneID/did-orchestrator-server/blob/develop/source/did-orchestrator-server/configs/application.yml) currently assigns 9001 to Orchestrator; 8090–8095 to TA, Issuer, Verifier, API, CA, and Wallet; 8097 to Proxy; 8098 to Ledger Service; and 8099 to Demo. PostgreSQL is configured on 5430. Check local configuration before deployment.
