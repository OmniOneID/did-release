# 변경 노트 - OpenDID v3.0.0.0

## 신규 및 변경 기능

- Holder 앱과 Issuer 사이에 Proxy 서버를 추가했습니다. Proxy는 엔티티가 아니므로 지갑·DID 등록 대상이 아닙니다.
- Issuer에 OID4VCI Credential Offer, Pre-Authorized Code 및 Authorization Code 발급, Issuer Metadata, Credential 발급, Status List 기능을 추가했습니다.
- Holder DID 서명 기반 Credential 폐기 기능을 OpenDID 확장으로 추가했습니다. 표준 OID4VCI 폐기 프로토콜을 의미하지 않습니다.
- Verifier에 OID4VP 검증과 SD-JWT VC·mdoc 처리를 추가했습니다.
- Orchestrator에 Proxy 관리와 서버 JAR 버전 3.0.0 설정을 반영했습니다.

## 문서

- [Orchestrator 설치 가이드](./OpenDID_Installation_Guide-Orchestrator-V3.0.0.0_ko.md)
- [수동 설치 가이드](./OpenDID_Installation_Guide-V3.0.0.0_ko.md)
- [시스템 요구사항](./OpenDID_System_Requirements_ko.md)
- [문서 허브](./OpenDID_Documentation_Hub_ko.md)
- [QA 계획서](./QA-PLAN-V3.0.0.0.md)

## 릴리스 상태

통합 릴리스 버전은 **3.0.0.0**, 개별 서버 빌드 버전은 **3.0.0**입니다. 릴리스 아티팩트와 태그는 게시 전에 확인해야 합니다. 현재 통합 테스트에서는 각 3.0 소스 브랜치에서 서버 JAR를 직접 빌드합니다.
