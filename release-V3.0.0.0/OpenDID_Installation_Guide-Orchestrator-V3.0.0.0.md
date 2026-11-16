# OpenDID Installation Guide — Orchestrator — v3.0.0.0

## 1. OpenDID Introduction

This guide sets up the OpenDID 3.0 integration environment with Orchestrator. Orchestrator controls TA, Issuer, Verifier, API Gateway, CA, Wallet, Proxy, Demo, and the selected ledger backend. The integrated release is 3.0.0.0; server build artifacts use 3.0.0.

The Proxy server relays the OpenDID VC issuance and revocation path between the Holder app and Issuer instead of TA. It is a service, not an entity, and has no wallet or DID registration step. OID4VCI is an additional Issuer issuance path with its own endpoints and credential offer flow.

## 2. Installation Overview

1. Prepare Java, Node.js, Git, Docker, and disk space.
2. Check out the Orchestrator source and build or obtain each 3.0.0 server JAR.
3. Configure the repository backend and database, then start Orchestrator.
4. Register the actual entities, start services, and configure Issuer and Verifier.
5. Run the OpenDID and OID4VCI integration checks.

## 3. System Requirements

See [System Requirements](./OpenDID_System_Requirements.md). Confirm ports 9001, 8090–8095, 8097–8099, and 5430 are available or update the Orchestrator configuration. Java 21 is required by the server builds. Use each repository's Gradle wrapper.

## 4. Prerequisites

Install Git, Java 21, Node.js 22.12.0, and Docker. Check out `release/QA-v3.0.0` in Orchestrator and every participating server repository, including Proxy. Check each repository's own installation guide for its database, configuration, and credential prerequisites.

## 5. Installation and Registration

### 5.1. Orchestrator source and server artifacts

```bash
git clone https://github.com/OmniOneID/did-orchestrator-server.git
cd did-orchestrator-server/source/did-orchestrator-server
./gradlew build
```

The `download.sh` script reads JAR assets from GitHub Releases tagged `V3.0.0`. Use `bash download.sh 3.0.0` **only after** those assets have been published. For current 3.0 integration testing, build the participating servers from source and place their `*-3.0.0.jar` files in the matching `jars/API`, `jars/CA`, `jars/Demo`, `jars/Issuer`, `jars/LSS`, `jars/Proxy`, `jars/TA`, `jars/Verifier`, and `jars/Wallet` directories. The file names must match `configs/application.yml`. Do not copy local wallet, DID, password, or database files into source control.

### 5.2. PostgreSQL and ledger backend

Start PostgreSQL using the Orchestrator control or the supplied Docker scripts. Select Hyperledger Besu or Ledger Service in the Orchestrator UI. Configure the backend required by your environment before registering entities. The default PostgreSQL port in `configs/application.yml` is 5430; Ledger Service uses 8098 when selected.

### 5.3. Start Orchestrator

Run the built Orchestrator JAR or the Gradle `bootRun` task from the source directory, then open `http://localhost:9001`. Confirm the configuration shows 3.0.0 JAR names and Proxy on port 8097. Refer to the [Orchestrator manual](https://github.com/OmniOneID/did-orchestrator-server/blob/release/QA-v3.0.0/docs/manual/orchestrator_manual.md) for UI controls.

![Orchestrator dashboard with Proxy running](./images/orchestrator-proxy-running-v3.jpg)

### 5.4. Register entities and start services

Create wallets and DID Documents only for entities that require them. Proxy must not appear in entity generation or `/entities`. Register TA, Issuer, Verifier, CA, and Wallet according to their server guides; start API Gateway and Demo as required. Start Proxy as a normal service and confirm its health and log view. Check that Issuer is reachable from Proxy.

## 6. Admin Configuration

Follow the V2 sequence: TA → Issuer → Verifier. Complete each Admin Console's first-login change and entity registration before these menus appear. For baseline OpenDID KYC, VC schema, issue profile, and VP policy setup, use the server admin guides. This section explains the OID4VCI and OID4VP screens added in 3.0 and their configuration order.

The example screens come from the 3.0 server admin guides. The live captures were taken from fresh local databases on 2026-11-10 at a consistent width of 1290 pixels. TA, Issuer, and Verifier registration and the admin settings below are complete; actual credential issuance and presentation submission require separate verification.

### 6.1. TA Admin — trust lists

#### 6.1.1. OID4VCI Credential Issuers

This list is where TA approves trusted OID4VCI issuers. When Issuer submits a List Provider registration request, TA receives a `REQUESTED` entry. Check the Issuer Metadata and user initiation URIs before approving it as `ACTIVE`. TA does not create the request in this screen.

| Screen item | Purpose |
| --- | --- |
| Credential Issuer | Identifier of the requesting issuer; `did:omn:issuer` in the capture environment. |
| Credential Issuer Metadata URI | Address where Wallet and List Provider retrieve issuer information. |
| User Initiation URI | Address where the user starts issuance. |
| Current Status / Status History | Current approval state and its change history. |

<img src="./images/ta-oid4vci-issuer-detail.png" width="800" alt="TA OID4VCI issuer status example"/>

- Example issuer detail showing where to check status and status history.

<img src="./images/ta-oid4vci-issuers-live.jpg" width="800" alt="Live TA OID4VCI issuer list before registration"/>

- The list before Issuer submits a request; no issuer row is present.

<img src="./images/ta-oid4vci-issuer-active-live.jpg" width="800" alt="Live TA OID4VCI issuer ACTIVE detail"/>

- TA approval result: current status and history show ACTIVE.

#### 6.1.2. mDoc Trusted Issuers

Register an issuer to trust for mdoc verification and select its allowed document types. Select a registered Issuer, load docTypes from its Metadata, and choose the types to allow. The capture environment allows `org.omnione.opendid.doc`.

| Screen item | Purpose |
| --- | --- |
| Issuer / DID | Issuer entity and DID to trust. |
| Issuer metadata URL / Load docTypes | Load the mdoc types declared in Issuer Metadata. |
| docTypes / Current Status | Allowed document types and registration state. |

<img src="./images/ta-mdoc-edit-live.jpg" width="800" alt="TA mdoc trusted issuer docType edit screen"/>

- The registered Issuer Metadata was loaded and `org.omnione.opendid.doc` was allowed.

<img src="./images/ta-mdoc-register-live.jpg" width="800" alt="Live TA mdoc trusted issuer form before enrollment"/>

- The mdoc trusted issuer form before selecting an Issuer and docType.

<img src="./images/ta-mdoc-issuer-active-live.jpg" width="800" alt="Live TA mdoc trusted issuer ACTIVE detail"/>

- Registered mdoc trusted issuer detail showing the allowed docType and ACTIVE status.

### 6.2. Issuer Admin — OID4VCI issuance

After Issuer entity registration, check Metadata → Credential Configurations → Client Settings → List Provider in order. For the VC schema and issue profile used by actual issuance, follow the [Issuer Admin guide](https://github.com/OmniOneID/did-issuer-server/blob/release/QA-v3.0.0/docs/admin/OpenDID_IssuerAdmin_Operation_Guide.md).

#### 6.2.1. Issuer Metadata

Configure the public issuer URL and issuance endpoints delivered to Wallets. Changing the Credential Issuer base URL affects the endpoints in public Metadata, so check that Wallets can reach it.

| Screen item | Purpose |
| --- | --- |
| Credential Issuer / Authorization Servers | Issuer base URL and authorization server URLs. |
| Credential Offer / Credential / Nonce Endpoint | Addresses for offers, credential requests, and one-time `c_nonce` requests. |
| Revocation / Deferred / Notification Endpoint | Addresses for revocation, deferred issuance, and notifications. Revocation is an OpenDID extension. |
| Request / Response Encryption | Supported and required encryption settings for credential requests and responses. |

<img src="./images/issuer-oid4vci-metadata.png" width="800" alt="Issuer OID4VCI Metadata example"/>

- Example Issuer Metadata screen for checking the public issuer URL and endpoints.

<img src="./images/issuer-oid4vci-metadata-live.jpg" width="800" alt="Live Issuer Metadata upper view"/>

- Live Metadata upper view with the capture Issuer public URL and basic settings.

<img src="./images/issuer-oid4vci-metadata-live-bottom.jpg" width="800" alt="Live Issuer Metadata endpoint view"/>

- Lower view showing Credential, Nonce, and other endpoints on port 8191.

#### 6.2.2. Credential Configurations

Register the credential format and Metadata exposed to Wallets. The capture example saves `CaptureMdocPID` as `mso_mdoc-did` with doctype `org.omnione.opendid.doc`. Registered configurations are assembled into `credential_configurations_supported` when public Issuer Metadata is retrieved.

| Screen item | Purpose |
| --- | --- |
| Configuration ID / Format | Identifier of the issuance configuration and credential format. |
| Identifiers (SDK) | Value used by the SDK to identify the credential; `mDocPID` in this example. |
| Document type (doctype) / Display name | Actual mdoc document type and name shown to Wallet users. |
| Scope / Cryptographic binding methods | Optional scope used to request it and supported key binding methods. |
| Claims | Claim paths, display labels, required flags, and value types. |

<img src="./images/issuer-oid4vci-config-register-live.jpg" width="800" alt="Live Credential Configuration form upper view"/>

- Empty registration form upper view for Configuration ID, format, and SDK identifier.

<img src="./images/issuer-oid4vci-config-register-live-bottom.jpg" width="800" alt="Live Credential Configuration form lower view"/>

- Lower form section for docType, display name, and claims.

<img src="./images/issuer-oid4vci-config-list-active-live.jpg" width="800" alt="Live saved Issuer Credential Configuration list"/>

- Saved Credential Configuration list showing CaptureMdocPID and its mdoc format.

<img src="./images/issuer-oid4vci-config-active-live.jpg" width="800" alt="Live Issuer mdoc Credential Configuration detail upper view"/>

- Saved detail upper view showing CaptureMdocPID, mso_mdoc-did, and mDocPID.

<img src="./images/issuer-oid4vci-config-active-live-bottom.jpg" width="800" alt="Live Issuer mdoc Credential Configuration detail lower view"/>

- Saved detail lower view showing `org.omnione.opendid.doc` and the given_name claim.

#### 6.2.3. Client Settings

Review common and platform-specific clients used for OID4VCI authorization. A Redirect URI returns the user to the app after authorization and must match the URI registered by that app. The captures show existing settings, not a newly created client.

| Screen item | Purpose |
| --- | --- |
| Main Client Settings | Common Client ID, secret, redirect URIs, and scopes. |
| Android / iOS Client | Client IDs and redirect URIs for the mobile apps. |
| Android / iOS OpenID Client | Separate client values for the OpenID variants of those apps. |

<img src="./images/issuer-oid4vci-client-settings.png" width="800" alt="Issuer Client Settings example"/>

- Example client settings for app Client IDs and redirect URIs.

<img src="./images/issuer-oid4vci-client-settings-live.jpg" width="800" alt="Live Issuer client settings upper view"/>

- Client settings upper view showing OID4VCI authorization and client defaults.

<img src="./images/issuer-oid4vci-client-settings-live-middle.jpg" width="800" alt="Live Issuer client settings middle view"/>

- Android and iOS Client IDs and redirect URIs in the middle section.

<img src="./images/issuer-oid4vci-client-settings-live-bottom.jpg" width="800" alt="Live Issuer client settings lower view"/>

- OpenDID Android and iOS Client settings in the lower section.

#### 6.2.4. List Provider

Submit the issuer information used for user-initiated Webview issuance to TA's List Provider. In the capture environment, the default TA port 8090 was changed to capture TA port 8190 before requesting registration. `REQUESTED` on this Issuer screen is the state saved at request time. Check the current state after TA approval in TA Admin's OID4VCI Credential Issuers detail.

| Screen item | Purpose |
| --- | --- |
| List Provider URL | TA List Provider address receiving the registration request. |
| Credential Issuer | Issuer identifier loaded from its DID. |
| Credential Issuer Metadata URI / User Initiation URI | Issuer information and issuance start addresses. |
| Registration Status / Refresh | Saved request-time state and reload of Issuer registration information. |

<img src="./images/issuer-oid4vci-list-provider.png" width="800" alt="Issuer List Provider example"/>

- Example List Provider form for reviewing the TA URL and Issuer Metadata URI.

<img src="./images/issuer-oid4vci-list-provider-live.jpg" width="800" alt="Live Issuer List Provider form before enrollment"/>

- Initial form: replace the default TA URL on port 8090 with the capture TA URL.

<img src="./images/issuer-oid4vci-list-provider-requested-live.jpg" width="800" alt="Live Issuer List Provider page still showing REQUESTED after TA approval"/>

- Issuer still shows REQUESTED after TA approval; the TA detail shows the approved state.

### 6.3. Verifier Admin — OID4VP verification

After Verifier entity registration, configure Configuration → DCQL Scope Management → Policy Management. For baseline OpenDID VP policies, follow the [Verifier Admin guide](https://github.com/OmniOneID/did-verifier-server/blob/release/QA-v3.0.0/docs/admin/OpenDID_VerifierAdmin_Operation_Guide.md).

#### 6.3.1. Configuration

Configure Verifier information sent to Wallets, session lifetime, and encryption options. The server has one such configuration, which applies to all OID4VP requests. The capture environment saves Base URL `http://127.0.0.1:8192`.

| Screen item | Purpose |
| --- | --- |
| Base URL / Client Name | Verifier base URL and name shown to Wallet users. |
| Client ID Scheme / Value | Verifier identification method and DID or redirect URI value. |
| Session TTL / Invocation Scheme | Session lifetime and Wallet invocation URI scheme. |
| Response Mode / JWE | `direct_post.jwt` response mode and encryption algorithms. |
| Enforce Claim Constraints / JSON Preview | Whether to enforce DCQL claims and a preview of saved settings. |

<img src="./images/verifier-oid4vp-config.png" width="800" alt="Verifier OID4VP Configuration example"/>

- Example OID4VP configuration for the Verifier URL, Client ID, and encryption.

<img src="./images/verifier-oid4vp-config-live.jpg" width="800" alt="Live Verifier OID4VP configuration upper view"/>

- Live upper view showing Base URL on port 8192 and the Verifier DID.

<img src="./images/verifier-oid4vp-config-live-bottom.jpg" width="800" alt="Live Verifier OID4VP configuration lower view"/>

- Lower view showing direct_post.jwt, JWE settings, and JSON Preview.

#### 6.3.2. DCQL Scope Management

A Scope groups the credential and claims requested from a Wallet into a DCQL Query. A Policy references that Scope. The capture example requests the `given_name` claim from an `org.omnione.opendid.doc` mdoc through `capture_pid_mdoc`.

| Screen item | Purpose |
| --- | --- |
| Scope / Description / Enabled | Request identifier, description, and whether it can be used. |
| Credential ID / Format | ID of a credential within DCQL and the requested format. |
| Meta `doctype_value` | Required mdoc document type. |
| Claims / DCQL Query JSON Preview | Requested namespace and claim, and generated query. |

<img src="./images/verifier-oid4vp-scope-edit-live.jpg" width="800" alt="Verifier DCQL scope edit upper view"/>

- The saved mdoc scope shows its identifier, format, and doctype.

<img src="./images/verifier-oid4vp-scope-edit-live-bottom.jpg" width="800" alt="Verifier DCQL scope edit lower view"/>

- The claim namespace and DCQL query use `org.omnione.opendid.doc`.

<img src="./images/verifier-oid4vp-scope-register-live.jpg" width="800" alt="Live Verifier DCQL scope form upper view"/>

- Empty DCQL scope form upper view for Scope and Credential ID.

<img src="./images/verifier-oid4vp-scope-register-live-bottom.jpg" width="800" alt="Live Verifier DCQL scope form lower view"/>

- Lower form section for format-specific metadata and JSON Preview.

<img src="./images/verifier-oid4vp-scope-list-active-live.jpg" width="800" alt="Live saved Verifier DCQL scope list"/>

- Saved scope list showing capture_pid_mdoc enabled.

<img src="./images/verifier-oid4vp-scope-active-live.jpg" width="800" alt="Live Verifier DCQL scope detail"/>

- Saved scope detail upper view with its name and the beginning of the DCQL query.

<img src="./images/verifier-oid4vp-scope-active-live-bottom.jpg" width="800" alt="Live Verifier DCQL scope detail lower view"/>

- Lower detail showing the query with `org.omnione.opendid.doc` and the given_name claim.

#### 6.3.3. Policy Management

An OID4VP Policy links to one previously registered DCQL Scope. When verification starts with a Policy, the linked Scope's DCQL Query is used in the Wallet request. The capture environment links `Capture PID mdoc policy` to `capture_pid_mdoc`.

| Screen item | Purpose |
| --- | --- |
| Policy Title | Name that identifies the verification policy. |
| Scope | DCQL Scope used by the Policy; select an enabled Scope during registration. |
| Policy ID | Identifier assigned automatically when saved. |

<img src="./images/verifier-oid4vp-policy-register.png" width="800" alt="Verifier OID4VP Policy registration example"/>

- Example OID4VP policy form linking a previously registered DCQL scope.

<img src="./images/verifier-oid4vp-policy-register-live.jpg" width="800" alt="Live Verifier policy form"/>

- Empty policy form for a title and linked DCQL scope.

<img src="./images/verifier-oid4vp-policy-list-active-live.jpg" width="800" alt="Live saved Verifier OID4VP policy list"/>

- Saved policy list linking Capture PID mdoc policy to capture_pid_mdoc.

<img src="./images/verifier-oid4vp-policy-active-live.jpg" width="800" alt="Live Verifier OID4VP policy detail"/>

- Policy detail showing its title and linked DCQL scope.

Configure Demo URLs and test data using the [Demo guide](https://github.com/OmniOneID/did-demo-server/blob/release/QA-v3.0.0/docs/installation/OpenDID_DemoServer_InstallationAndOperation_Guide.md). Record actual credential issuance and presentation results separately against the [QA plan](./QA-PLAN-V3.0.0.0.md).

## 7. OpenDID Test Guide

1. Verify all selected services are healthy in Orchestrator and that Proxy has no wallet/DID generation controls.
2. Complete Holder registration, then run an OpenDID VC issuance through **Holder app → Proxy → Issuer**. Verify the offer/profile, issuance, and completion responses. Confirm TA is not the relay for this issuance path.
3. Run an OID4VCI issuance from Issuer: read Issuer Metadata, obtain a Credential Offer, complete either Pre-Authorized Code or Authorization Code, submit Holder proof, and retrieve the credential. Use a compatible OID4VCI wallet and the [Demo guide](https://github.com/OmniOneID/did-demo-server/blob/release/QA-v3.0.0/docs/installation/OpenDID_DemoServer_InstallationAndOperation_Guide.md).
4. Check the Credential Status List and, where configured, the OpenDID Holder-signed revocation extension. Verify invalid or reused nonce/proof requests are rejected.
5. Submit an OpenDID VP and, separately, an OID4VP presentation to Verifier. Check supported SD-JWT VC and mdoc paths.

Record the results against the [QA plan](./QA-PLAN-V3.0.0.0.md). Android and iOS app instructions will be updated separately.

![Proxy API endpoints in Swagger](./images/proxy-api-v3.jpg)
