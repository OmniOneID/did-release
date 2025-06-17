# OpenDID 시스템 요구사항

본 문서는 OpenDID 전체 시스템(서버 7개 및 인프라 포함)을 설치하고 실행하기 위한 최소사양 및 권장사양을 안내합니다.

---

## 시스템 구성 요소

- **OpenDID 서버 7종**: TA, Issuer, Verifier, CA, Wallet, API Gateway, Demo
- **인프라 구성**: PostgreSQL, Hyperledger Besu (또는 Ledger Service Server)

---

## 시스템 요구사항

| 항목                 | 최소사양                                          | 권장사양                   |
| -------------------- | ------------------------------------------------- | -------------------------- |
| **운영체제(OS)**     | Linux 또는 macOS<br>Windows 10/11*                | Linux 또는 macOS           |
| **CPU**              | 4 Core                                            | 8 Core 이상                |
| **메모리(RAM)**      | 8 GB                                              | 16 GB 이상                 |
| **디스크 용량**      | 20 GB 이상 (SSD 권장)                             | 50 GB 이상 (NVMe SSD 권장) |
| **Java 버전**        | Java 21                                       | Java 21                    |
| **Gradle 버전**      | Gradle 7.0 이상 (Orchestrator 빌드용)             | Gradle 8.x 최신 버전       |
| **Node.js 버전**     | Node.js 22.12.0                                   | Node.js 22.12.0            |
| **Git**              | Git 2.30 이상                                     | Git 최신 버전              |
| **Bash**             | Bash 4.0 이상 (Linux 기본 제공, macOS는 zsh 기본) | Bash 5.0 이상 또는 zsh     |
| **Docker**           | Docker 20.10 이상 (Docker Compose 포함)           | Docker 24.x 이상           |
| **PostgreSQL**       | 16.4                                              | 16.8 이상                  |
| **Hyperledger Besu** | 25.5.0                                            | 25.x 최신 안정 버전        |

> PostgreSQL 및 Hyperledger Besu 권장 버전은 각각 16.x / 25.x 계열의 최신 안정 버전을 기준으로 합니다.

---


## 운영체제별 특이사항

### Linux (권장)
- 모든 구성 요소 완전 지원
- Docker 기반 인프라 구성 최적화

### macOS (권장)
- 모든 구성 요소 완전 지원
- Intel/Apple Silicon 모두 지원

### Windows
- **제한사항**: Hyperledger Besu 미지원
- **대안**: `ledger-service-server` 사용으로 블록체인 기능 대체 가능
- WSL2 환경 사용 시 Linux와 동일한 기능 이용 가능

---

## 참고 사항

- 인프라 구성(PostgreSQL, Hyperledger Besu)은 Docker 기반 실행을 전제로 합니다.
- 개발 환경에서는 최소사양으로도 동작하나, 운영 환경에서는 권장사양 이상을 사용하시기 바랍니다.
- 멀티 서버 구성 시에는 각 서버별로 별도의 리소스 할당이 필요할 수 있습니다.
- PostgreSQL 및 Hyperledger Besu의 버전은 각각 16.x, 25.x 계열의 최신 안정 버전 사용을 권장합니다.