# OpenDID 시스템 요구사항 — v3.0.0.0

아래 사양은 개발·통합 테스트 환경 기준입니다. 운영 환경의 자원은 트래픽과 배포 구조에 맞춰 별도로 산정해야 합니다.

## 구성 요소

- 서비스: TA, Issuer, Verifier, API Gateway, CA, Wallet, Proxy, Demo, 선택적으로 Ledger Service.
- 인프라: PostgreSQL과 Hyperledger Besu 또는 서버 설정에서 지원하는 Ledger Service 대안.
- Orchestrator: 로컬 서비스 관리에 사용합니다. Proxy는 서비스이며 엔티티 지갑·DID가 필요하지 않습니다.

## 호스트 요구사항

| 항목 | 최소·기준 | 로컬 통합 테스트 권장 |
| --- | --- | --- |
| 운영체제 | Linux 또는 macOS; Windows는 WSL2 사용 | Linux 또는 macOS |
| CPU | 4코어 | 8코어 이상 |
| 메모리 | 8GB | 16GB 이상 |
| 여유 디스크 | 20GB | 50GB 이상 |
| Java | 21 | 21 |
| Gradle | 각 저장소의 wrapper 사용 | 각 저장소의 wrapper 사용 |
| Node.js | Orchestrator 관리 화면 빌드 기준 22.12.0 | 22.12.0 |
| Git | 2.30 이상 | 지원되는 최신 버전 |
| Docker | 제공되는 DB·Besu 구성에 필요 | 지원되는 최신 버전 |

CPU·메모리·디스크 수치는 V2 통합 환경 기준을 이어받은 것으로, 전체 V3 배포에서 성능 검증된 수치는 아닙니다. 로컬 JAR 빌드와 동시 실행에 필요한 여유 자원을 확보하세요.

## 네트워크 포트

현재 [Orchestrator 설정](https://github.com/OmniOneID/did-orchestrator-server/blob/release/QA-v3.0.0/source/did-orchestrator-server/configs/application.yml)은 Orchestrator 9001, TA·Issuer·Verifier·API·CA·Wallet 8090–8095, Proxy 8097, Ledger Service 8098, Demo 8099, PostgreSQL 5430을 사용합니다. 배포 전 현지 설정을 확인하세요.
