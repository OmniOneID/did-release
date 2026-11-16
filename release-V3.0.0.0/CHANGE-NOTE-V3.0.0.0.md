# Change Note - OpenDID v3.0.0.0

## New and Updated Features

- Added the Proxy server to the OpenDID VC issuance path between the Holder app and Issuer. Proxy is a service, not an entity; it has no wallet or DID registration step.
- Added OID4VCI issuance to Issuer, including Credential Offers, Pre-Authorized Code and Authorization Code flows, Issuer Metadata, credential delivery, and Status Lists.
- Added an OpenDID extension for Holder-signed credential revocation. This extension is not a standard OID4VCI revocation protocol.
- Added OID4VP verification and SD-JWT VC and mdoc handling to Verifier.
- Updated Orchestrator to manage the Proxy service and use version 3.0.0 server JARs.

## Documentation

- [Orchestrator installation guide](./OpenDID_Installation_Guide-Orchestrator-V3.0.0.0.md)
- [Manual installation guide](./OpenDID_Installation_Guide-V3.0.0.0.md)
- [System requirements](./OpenDID_System_Requirements.md)
- [Documentation hub](./OpenDID_Documentation_Hub.md)
- [QA plan](./QA-PLAN-V3.0.0.0.md)

## Release Status

The integrated release version is **3.0.0.0**; individual server build versions are **3.0.0**. Release artifacts and tags must be verified before publication. Until then, build server JARs from the corresponding 3.0 source branches for integration testing.
