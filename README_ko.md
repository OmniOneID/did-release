# did-release
did-release 저장소에 오신 것을 환영합니다.
이 저장소는 QA 검증된 릴리즈 버전을 제공합니다!

## 폴더 구조
```
did-release
├── README.md
├── docs
│   ├── CI_CD_PIPELINE.md
│   ├── MAINTAINERS.md
│   └── RELEASE-PROCESS.md
└── release-VW.X.Y.Z
    ├── OpenDID_Installation_Guide-VW.X.Y.Z.md
    ├── QA-PLAN-VW.X.Y.Z.md
    ├── RELEASE-NOTE-VW.X.Y.Z.md
    └── images
```
| 이름                     | 설명                                             |
| ----------------------- | ----------------------------------------------- |
| docs                    | 문서                                             |
| ┖ CI_CD_PIPELINE.md     | CI/CD 파이프라인 가이드                              |
| ┖ MAINTAINERS.md        | 프로젝트 유지 관리자 지침                              |
| ┖ RELEASE-PROCESS.md    | 릴리즈 프로세스 가이드                               |
| release-VW.X.Y.Z        | 릴리즈 버전 관리                                      |
| ┖ OpenDID_Installation_Guide-VW.X.Y.Z.md | 해당 버전 설치 가이드                                 |
| ┖ QA-PLAN-VW.X.Y.Z.md   | 해당 버전의 QA 계획서 (issues 메뉴에서도 포함됨)                 |
| ┖ RELEASE-NOTE-VW.X.Y.Z.md | 해당 버전의 릴리즈 노트 (Releases 메뉴에도 게시됨)             |

## Release Process
- [Release Process](docs/RELEASE-PROCESS.md) - 기능 추가 및 수정사항에 대한 QA 검증 및 배포 절차를 설명합니다.

## CI/CD 파이프라인
- [CI/CD 파이프라인](docs/CI_CD_PIPELINE.md) - GitHub Actions를 사용한 CI/CD 프로세스를 설명합니다.
