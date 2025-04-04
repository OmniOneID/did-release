# OpenDID System Requirements

This document outlines the minimum and recommended system requirements  
for installing and running the complete OpenDID system, including 7 servers and supporting infrastructure.

---

## System Components

- 7 OpenDID servers: TA, Issuer, Verifier, CA, Wallet, API Gateway, Demo
- Infrastructure: PostgreSQL, Hyperledger Fabric (Test Network)

---

## System Requirements

| Item              | Minimum Requirements                                                        | Recommended Requirements                                 |
|-------------------|-----------------------------------------------------------------------------|----------------------------------------------------------|
| Operating System  | macOS 12 Monterey or higher<br>Ubuntu 20.04+<br>Windows 10/11 (for testing) | macOS 15 Sequoia or higher<br>Ubuntu 22.04<br>Windows 11 |
| CPU               | 4 Core                                                                      | 6 Core or higher                                         |
| Memory (RAM)      | 4 GB                                                                        | 8 GB or higher                                           |
| Disk Space        | 10 GB or more (SSD recommended)                                             | 20 GB or more (SSD recommended)                          |
| Java Version      | Java 17 or higher                                                           | Java 17 or higher                                        |
| Docker            | Docker 20.10+ (including Docker Compose)                                    | Latest Docker recommended                                |
| PostgreSQL        | 16.4                                                                         | 16.8                                                     |
| Fabric Version    | v2.5.10 (based on test-network)                                              | v2.5.12 (based on test-network)                          |

> The recommended PostgreSQL version refers to the latest stable release in the 16.x series (e.g., 16.8).  
> The recommended Fabric version refers to the latest stable release in the 2.5.x series (e.g., 2.5.12).

---

## Notes

- Infrastructure components (PostgreSQL, Hyperledger Fabric) are assumed to run in a Docker environment.
- Windows is suitable for development and testing, but Linux or macOS is strongly recommended for production and stable operation.
