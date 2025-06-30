# OpenDID System Requirements

This document provides the minimum and recommended specifications for installing and running the complete OpenDID system (7 servers and infrastructure components).

---

## System Components

- **OpenDID Servers (7 types)**: TA, Issuer, Verifier, CA, Wallet, API Gateway, Demo
- **Infrastructure Components**: PostgreSQL, Hyperledger Besu (or Ledger Service Server)

---

## System Requirements

| Item                 | Minimum Requirements                                                            | Recommended Requirements                                      |
| -------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| **Operating System** | Linux (CentOS Stream 10, Oracle Linux 8.1) <br/> macOS Sonoma<br>Windows 10/11* | Linux (CentOS Stream 10, Oracle Linux 8.1) <br/> macOS Sonoma |
| **CPU**              | 4 Cores                                                                         | 8 Cores or higher                                             |
| **Memory (RAM)**     | 8 GB                                                                            | 16 GB or higher                                               |
| **Disk Space**       | 20 GB or higher (SSD recommended)                                               | 50 GB or higher (NVMe SSD)                                    |
| **Java Version**     | Java 21                                                                         | Java 21                                                       |
| **Gradle Version**   | Gradle 7.0 or higher (for Orchestrator build)                                   | Gradle 8.x latest version                                     |
| **Node.js Version**  | Node.js 22.12.0                                                                 | Node.js 22.12.0                                               |
| **Git**              | Git 2.30 or higher                                                              | Git latest version                                            |
| **Shell**            | Bash 4.0+ (Linux default), zsh (macOS default)                                  | Bash 5.0+ or zsh                                              |
| **Docker**           | Docker Engine - Community Version: 27.3.1                                       | Docker Engine - Community Version: 27.3.1                     |
| **PostgreSQL**       | 16.4                                                                            | 16.8 or higher                                                |
| **Hyperledger Besu** | 25.5.0                                                                          | Latest stable 25.x version                                    |

> \* Windows environments require `ledger-service-server` instead of Hyperledger Besu

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