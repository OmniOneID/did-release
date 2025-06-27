   ## QA 계획서 V2.0.0.0


| 구분           | 내용             |
|----------------|------------------|
| **착수미팅**    | 2025.5.21       |
| **이슈할당**    | mikyung-lee      |
| **검증요청목적** | 신규 버전 출시    |

### did-doc-architecture

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | Visual Studio Code, yEd                                                                 |
| **연동모듈**      | -                                                                                        |
| **문서갱신**      | conceps/VC Issuance (ZKP부분추가)<br>conceps/Presentation of ZKP Proof (ZKP부분추가)<br>concepts/life_cycle (ZKP부분추가)<br>data standard/verifiable credential format/Profile format (ZKP부분추가)<br>data standard/data specification/Data Specification (ZKP부분추가)<br>data standard/data specification/ZKP Data Specification<br>data standard/zkp credential format/<br>security/ZKP |
| **주요변경사항**  | -                                                                                       |
| **QA포인트**      | -                                                                                       |

### did-ta-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | did-blockchain-sdk-server<br>did-core-sdk-server<br>did-crypto-sdk-server<br>did-datamodel-sdk-server<br>did-sdk-common<br>did-wallet-sdk-server<br>did-zkp-sdk-server |
| **문서갱신**      | TAS_API<br>OpenDID_TAAdmin_Operation_Guide<br>OpenDID_TableDefinition_TAS<br>TAS_ErrorCode<br>OpenDID_TAServer_Installation_Guide |
| **주요변경사항**  | Admin Console 추가                                                                      |
| **QA포인트**      | 1. [Admin] TA 관리 메뉴<br>2. [Admin] Entity 관리 메뉴<br>3. [Admin] KYC 설정 메뉴<br>4. [Admin] API 설정 메뉴<br>5. [Admin] Notification 사업자 설정 메뉴 - Push 제외<br>6. [Admin] List 사업자 메뉴<br>7. [Admin] User 관리 메뉴<br>8. [Admin] Admin 관리 메뉴 |
### did-issuer-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | did-blockchain-sdk-server<br>did-core-sdk-server<br>did-crypto-sdk-server<br>did-datamodel-sdk-server<br>did-sdk-common<br>did-wallet-sdk-server<br>did-zkp-sdk-server |
| **문서갱신**      | Issuer Service API                                                                      |
| **주요변경사항**  | Admin Console 추가, ZKP 발급 추가                                                       |
| **QA포인트**      | 1. [Admin] Issuer 관리 메뉴<br>2. [Admin] VC 관리 메뉴<br>3. [Admin] ZKP 관리 메뉴<br>4. [Admin] 사용자 발급 정보<br>5. [Admin] 발급된 VC 확인 메뉴<br>6. [Admin] Admin 관리 메뉴<br>7. VC 발급<br>8. ZKP 발급(VC 발급시 같이 발급됨) |

### did-verifier-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | did-blockchain-sdk-server<br>did-core-sdk-server<br>did-crypto-sdk-server<br>did-datamodel-sdk-server<br>did-sdk-common<br>did-wallet-sdk-server<br>did-zkp-sdk-server |
| **문서갱신**      | Verifier Service API                                                                    |
| **주요변경사항**  | Admin Console 추가, ZKP 검증 추가                                                       |
| **QA포인트**      | 1. [Admin] Verifier 관리 메뉴<br>2. [Admin] VP 정책 관리 메뉴<br>3. [Admin] ZKP 정책 관리 메뉴<br>4. [Admin] Admin 관리 메뉴<br>5. VP 검증<br>6. ZkpVP 검증 |

### did-wallet-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | did-blockchain-sdk-server<br>did-core-sdk-server<br>did-crypto-sdk-server<br>did-datamodel-sdk-server<br>did-sdk-common<br>did-wallet-sdk-server<br>did-zkp-sdk-server |
| **문서갱신**      | OpenDID_WalletAdmin_Operation_Guide<br>OpenDID_TableDefinition_Wallet<br>Wallet_ErrorCode<br>OpenDID_WalletServer_Installation_Guide |
| **주요변경사항**  | Admin Console 추가                                                                      |
| **QA포인트**      | 1. [Admin] Wallet Service 관리 메뉴<br>2. [Admin] User Wallet 관리 메뉴<br>3. [Admin] Admin 관리 메뉴 |

### did-ca-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | did-blockchain-sdk-server<br>did-core-sdk-server<br>did-crypto-sdk-server<br>did-datamodel-sdk-server<br>did-sdk-common<br>did-wallet-sdk-server<br>did-zkp-sdk-server |
| **문서갱신**      | OpenDID_CAAdmin_Operation_Guide<br>OpenDID_TableDefinition_CAS<br>CA_ErrorCode<br>OpenDID_CAServer_Installation_Guide |
| **주요변경사항**  | Admin Console 추가                                                                      |
| **QA포인트**      | 1. [Admin] CA 관리 메뉴<br>2. [Admin] User 관리 메뉴<br>3. [Admin] Admin 관리 메뉴 |

### did-api-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | did-blockchain-sdk-server<br>did-core-sdk-server<br>did-crypto-sdk-server<br>did-datamodel-sdk-server<br>did-sdk-common<br>did-wallet-sdk-server<br>did-zkp-sdk-server |
| **문서갱신**      | APIGateway_API                                                                          |
| **주요변경사항**  | BESU 블록체인 연동 추가                                                                 |
| **QA포인트**      | BESU 블록체인 연동 정상 동작 여부 확인                                                  |

### did-cli-tool-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | did-datamodel-sdk-server<br>did-core-sdk-server<br>did-wallet-sdk-server<br>did-crypto-sdk-server |
| **문서갱신**      | SDK-API 가이드                                                                          |
| **주요변경사항**  | -                                                                                       |
| **QA포인트**      | 1. wallet 생성<br>2. DID Document 생성                                                  |

### did-datamodel-sdk-server

| 항목             | 내용             |
|------------------|------------------|
| **모듈버전**      | 2.0.0            |
| **개발환경**      | IntelliJ         |
| **연동모듈**      | -                |
| **문서갱신**      | -                |
| **주요변경사항**  | -                |
| **QA포인트**      | 1. 데이터 모델 직렬화 및 역직렬화 |

### did-blockchain-sdk-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | did-datamodel-sdk-server<br>did-zkp-sdk-server                                           |
| **문서갱신**      | SDK API, 가이드 문서                                                                    |
| **주요변경사항**  | EVM 환경 기능 지원<br>ZKP 관련 데이터 저장/조회 (EVM 환경 전용)                        |
| **QA포인트**      | 1. EVM 환경 정상 연결 여부<br>2. ZKP<br>3. DID 문서 조회<br>4. DID 문서 폐기<br>5. VC 메타 데이터 등록<br>6. VC 메타 데이터 조회<br>7. CredentialSchema 등록<br>8. CredentialSchema 조회<br>9. CredentialDefinition 등록<br>10. CredentialDefinition 조회 |

### did-core-sdk-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | did-datamodel-sdk-server<br>did-crypto-sdk-server                                        |
| **문서갱신**      | SDK-API 가이드, 에러코드 가이드                                                         |
| **주요변경사항**  | -                                                                                       |
| **QA포인트**      | 1. DID 생성 및 서명 검증<br>2. VC 생성<br>3. VP 검증                                   |

### did-wallet-sdk-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | did-crypto-sdk-server                                                                    |
| **문서갱신**      | SDK-API 가이드, 에러코드 가이드                                                         |
| **주요변경사항**  | -                                                                                       |
| **QA포인트**      | 1. wallet 생성<br>2. 키 관리<br>3. wallet에 저장된 키로 서명                            |

### did-crypto-sdk-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | -                                                                                       |
| **문서갱신**      | SDK-API 가이드, 에러코드 가이드                                                         |
| **주요변경사항**  | -                                                                                       |
| **QA포인트**      | 1. 키 생성<br>2. SharedSecret 생성<br>3. 암 / 복호화<br>4. 서명 및 서명 검증            |

### did-common-sdk-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | -                                                                                       |
| **문서갱신**      | Server Common SDK_JsonUtil<br>Server Common SDK_DateTimeUtil                           |
| **주요변경사항**  | JsonUtil 기능 추가<br>DateTimeUtil 기능 추가                                           |
| **QA포인트**      | -                                                                                       |

### did-ca-aos

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | Android Studio Ladybug, compileSDK 34                                                  |
| **최소사양**      | Android 8.0 (API 26)                                                                    |
| **권장사양**      | Android 14 (API 34)                                                                     |
| **연동모듈**      | did-wallet-sdk-aos.jar                                                                  |
| **문서갱신**      | 가이드 문서                                                                             |
| **주요변경사항**  | Client 통합 SDK 연동, ZKP 로직 추가<br>VC 상세화면 UI 변경<br>QR 스캔 후 ZKP 선택 제출 기능 추가 |
| **QA포인트**      | 일반 VC 발급 시 ZKP Credential 함께 발급<br>VC 목록에 ZKP 표시 및 상세 표시<br>ZKP 선택 제출 |

### did-ca-ios

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | Xcode 16.2 / iOS 17.5 (iPhone 15 시뮬레이터)                                             |
| **최소사양**      | iOS 15 (SDK 기준 통일)                                                                  |
| **권장사양**      | 최신 iOS 버전(18.5) 지원                                                                |
| **연동모듈**      | DIDWalletSDK.xcframework, DIDCA Application Modules                                     |
| **문서갱신**      | 기본 문서                                                                               |
| **주요변경사항**  | 기존 UI에 ZKP 정보 추가 및 선택 제출 화면 추가<br>ZKP 연동                            |
| **QA포인트**      | ZKP 존재 시 메인/상세화면 표시<br>ZKP 정상 선택 제출 여부 확인                          |

### did-client-sdk-aos

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | Android Studio Ladybug, compileSDK 34                                                  |
| **최소사양**      | Android 8.0                                                                             |
| **권장사양**      | Android 14                                                                              |
| **연동모듈**      | -                                                                                       |
| **문서갱신**      | SDK API, 가이드 문서                                                                    |
| **주요변경사항**  | Client 통합 SDK 연동, ZKP 로직 추가                                                     |
| **QA포인트**      | ZKP 발급, 제출                                                                          |

### did-client-sdk-ios

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | Xcode 16.2 / iOS 17.5 (iPhone 15 시뮬레이터)                                             |
| **최소사양**      | iOS 15                                                                                  |
| **권장사양**      | 최신 iOS 버전(18.5) 지원                                                                |
| **연동모듈**      | DIDWalletSDK.xcframework                                                                |
| **문서갱신**      | SDK API, 가이드 문서                                                                    |
| **주요변경사항**  | SDK 통합, ZKP 관련 API 추가                                                             |
| **QA포인트**      | ZKP 포함 발급 처리<br>ZKP Credential 요청 정상 처리<br>ZKProof 정상 생성               |

### did-besu-contract

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | Hardhat                                                                                  |
| **연동모듈**      | -                                                                                       |
| **문서갱신**      | -                                                                                       |
| **주요변경사항**  | 신규 개발                                                                                |
| **QA포인트**      | DID 등록/조회/폐기<br>VC 메타 등록/조회<br>CredentialSchema/Definition 등록 및 조회<br>스마트컨트랙트 정상 배포 |

### did-demo-app

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | -                                                                                       |
| **문서갱신**      | -                                                                                       |
| **주요변경사항**  | 신규 개발                                                                                |
| **QA포인트**      | main branch 기준 관리<br>URL: https://omnioneid.github.io/did-demo-app/<br>인가앱 절차 기준 확인 |

### did-demo-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | did-crypto-sdk-server                                                                    |
| **문서갱신**      | -                                                                                       |
| **주요변경사항**  | 서버 세팅 및 사용자 정보 동적 입력<br>VC/VP 동적 제출 처리                               |
| **QA포인트**      | 동적 VC 발급, VP 제출                                                                    |

### did-zkp-sdk-server

| 항목             | 내용             |
|------------------|------------------|
| **모듈버전**      | 2.0.0            |
| **개발환경**      | IntelliJ         |
| **연동모듈**      | did-crypto-sdk-server |
| **문서갱신**      | ZKP_SDK_SERVER_API |
| **주요변경사항**  | -                |
| **QA포인트**      | ZKP Credential 발급 및 검증 |

### did-orchestrator-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | IntelliJ                                                                                 |
| **연동모듈**      | -                                                                                       |
| **문서갱신**      | Orchestrator_API<br>OpenDID_orchestrator_InstallationAndOperation_Guide<br>orchestrator_manual |
| **주요변경사항**  | 신규 개발                                                                                |
| **QA포인트**      | 각 서버 및 저장소 구동/중지/상태 조회                                                   |

### did-release

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | -                                                                                       |
| **연동모듈**      | -                                                                                       |
| **문서갱신**      | OpenDID_Installation_Guide<br>OpenDID_System_Requirements<br>OpenDID_Documentation_Hub |
| **주요변경사항**  | 어드민 설치 가이드 추가<br>서버 문서 링크 추가                                           |
| **QA포인트**      | 설치 가이드 순서로 서버 설치 및 테스트 진행                                              |

### did-ledger-service-server

| 항목             | 내용                                                                                     |
|------------------|------------------------------------------------------------------------------------------|
| **모듈버전**      | 2.0.0                                                                                   |
| **개발환경**      | -                                                                                       |
| **연동모듈**      | did-blockchain-sdk-server<br>did-core-sdk-server<br>did-crypto-sdk-server<br>did-datamodel-sdk-server<br>did-sdk-common<br>did-wallet-sdk-server<br>did-zkp-sdk-server |
| **문서갱신**      | -                                                                                       |
| **주요변경사항**  | 신규 개발                                                                                |
| **QA포인트**      | 블록체인의 모든 기능 대체 가능 여부 확인                                                |
