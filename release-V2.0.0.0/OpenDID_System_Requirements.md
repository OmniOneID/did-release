# OpenDID System Requirements

This document provides the minimum and recommended specifications for installing and running the complete OpenDID system (7 servers and infrastructure components).

---

## System Components

- **OpenDID Servers (7 types)**: TA, Issuer, Verifier, CA, Wallet, API Gateway, Demo
- **Infrastructure Components**: PostgreSQL, Hyperledger Besu (or Ledger Service Server)

---

## System Requirements

| Item                 | Minimum Requirements                               | Recommended Requirements       |
| -------------------- | -------------------------------------------------- | ------------------------------ |
| **Operating System** | Linux or macOS<br>Windows 10/11*                  | Linux or macOS                 |
| **CPU**              | 4 Cores                                            | 8 Cores or higher              |
| **Memory (RAM)**     | 8 GB                                               | 16 GB or higher                |
| **Disk Space**       | 20 GB or higher (SSD recommended)                 | 50 GB or higher (NVMe SSD)     |
| **Java Version**     | Java 17 or higher<br>(Orchestrator requires Java 21+) | Java 21                        |
| **Gradle Version**   | Gradle 7.0 or higher (for Orchestrator build)     | Gradle 8.x latest version      |
| **Node.js Version**  | Node.js 22.12.0 (for Orchestrator frontend)       | Node.js 22.12.0 or higher     |
| **Git**              | Git 2.30 or higher                                | Git latest version             |
| **Shell**            | Bash 4.0+ (Linux default), zsh (macOS default)    | Bash 5.0+ or zsh              |
| **Docker**           | Docker 20.10+ (with Docker Compose)               | Docker 24.x or higher          |
| **PostgreSQL**       | 16.4                                               | 16.8 or higher                 |
| **Hyperledger Besu** | 25.5.0                                             | Latest stable 25.x version     |

> \* Windows environments require `ledger-service-server` instead of Hyperledger Besu

---

## Network Requirements

- **Ports**: The following ports must be available
 - HTTP: 8080-8090 (default ports for each server)
 - PostgreSQL: 5432
 - Hyperledger Besu: 8545, 30303
- **Firewall**: Local communication must be allowed in development/test environments

---

## Operating System Specific Notes

### Linux (Recommended)
- Full support for all components
- Optimized Docker-based infrastructure configuration

### macOS (Recommended)
- Full support for all components
- Support for both Intel and Apple Silicon

### Windows
- **Limitation**: Hyperledger Besu not supported
- **Alternative**: Use `ledger-service-server` to replace blockchain functionality
- WSL2 environment provides Linux-equivalent functionality

---

## Additional Notes

- Infrastructure components (PostgreSQL, Hyperledger Besu) are designed to run on Docker.
- Development environments can operate with minimum specifications, but production environments should use recommended specifications or higher.
- Multi-server configurations may require separate resource allocation for each server.
- For PostgreSQL and Hyperledger Besu, we recommend using the latest stable versions from the 16.x and 25.x series respectively.