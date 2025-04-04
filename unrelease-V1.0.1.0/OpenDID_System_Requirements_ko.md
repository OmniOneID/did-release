# OpenDID 시스템 요구사항

본 문서는 OpenDID 전체 시스템(서버 7개 및 인프라 포함)을 설치하고 실행하기 위한  
최소사양 및 권장사양을 안내합니다.

---

## 시스템 구성 요소

- OpenDID 서버 7종: TA, Issuer, Verifier, CA, Wallet, API Gateway, Demo
- 인프라 구성: PostgreSQL, Hyperledger Fabric (Test Network)

---

## 시스템 요구사항

| 항목               | 최소사양                                                                | 권장사양                                            |
|--------------------|-------------------------------------------------------------------------|-----------------------------------------------------|
| 운영체제(OS)       | macOS 12 Monterey 이상<br>Ubuntu 20.04 이상<br>Windows 10/11 (테스트용) | macOS 15 Sequoia 이상<br>Ubuntu 22.04<br>Windows 11 |
| CPU                | 4 Core                                                                  | 6 Core 이상                                         |
| 메모리(RAM)        | 4 GB                                                                    | 8 GB 이상                                           |
| 디스크 용량        | 10 GB 이상 (SSD 권장)                                                   | 20 GB 이상 (SSD 권장)                               |
| Java 버전          | Java 17 이상                                                            | Java 17 이상                                        |
| Docker             | Docker 20.10 이상 (Compose 포함)                                        | Docker 최신 권장                                    |
| PostgreSQL 버전    | 16.4                                                                    | 16.8                                                |
| Fabric 버전        | v2.5.10 (test-network 구성 기준)                                        | v2.5.12 (test-network 구성 기준)                    |

> PostgreSQL 권장 버전은 16.x 계열의 최신 안정 버전(예: 16.8)을 기준으로 합니다.  
> Hyperledger Fabric 권장 버전은 2.5.x 계열의 최신 안정 버전(예: 2.5.12)을 기준으로 합니다.

---

## 참고 사항

- 인프라 구성(PostgreSQL, Hyperledger Fabric)은 Docker 기반 실행을 가정합니다.
- Windows 환경은 테스트 또는 개발용으로 사용 가능하며, Linux/macOS 환경에서의 실행을 권장합니다.
