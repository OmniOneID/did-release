---
puppeteer:
    pdf:
        format: A4
        displayHeaderFooter: true
        landscape: false
        scale: 0.8
        margin:
            top: 1.2cm
            right: 1cm
            bottom: 1cm
            left: 1cm
    image:
        quality: 100
        fullPage: false
---

Open DID Installation Guide
==

- Date: 2024-09-07
- Version: v1.0.0

Table of Contents
==

- [1. Overview](#1-overview)
- [2. Installation Overview](#2-installation-overview)
  - [2.1. Quick Installation with Orchestrator](#21-quick-installation-with-orchestrator)
    - [2.1.1. Installing Orchestrator](#211-installing-orchestrator)
    - [2.1.2. Installing and Running Servers with Orchestrator](#212-installing-and-running-servers-with-orchestrator)
- [3. System Requirements](#3-system-requirements)
  - [3.1. Server](#31-server)
  - [3.2. App](#32-app)
- [4. Prerequisites](#4-prerequisites)
  - [4.1. Installing Git](#41-installing-git)
  - [4.2. Installing Gradle](#42-installing-gradle)
  - [4.3. Installing cli-tool](#43-installing-cli-tool)
  - [4.4. Creating Wallet Files](#44-creating-wallet-files)
    - [4.4.1. Creating the Wallet File for the TA Server](#441-creating-the-wallet-file-for-the-ta-server)
    - [4.4.2. Creating the Wallet File for the Issuer Server](#442-creating-the-wallet-file-for-the-issuer-server)
    - [4.4.3. Creating the Wallet File for the Verifier Server](#443-creating-the-wallet-file-for-the-verifier-server)
    - [4.4.4. Creating the Wallet File for the CA Server](#444-creating-the-wallet-file-for-the-ca-server)
    - [4.4.5. Creating the Wallet File for the Wallet Server](#445-creating-the-wallet-file-for-the-wallet-server)
  - [4.5. Adding Wallet keys](#45-adding-wallet-keys)
    - [4.5.1. Creating Key Pairs for the TA Server](#451-creating-key-pairs-for-the-ta-server)
    - [4.5.2. Creating Key Pairs for the Issuer Server](#452-creating-key-pairs-for-the-issuer-server)
    - [4.5.3. Creating Key Pairs for the Verifier Server](#453-creating-key-pairs-for-the-verifier-server)
    - [4.5.4. Creating Key Pairs for the CA Server](#454-creating-key-pairs-for-the-ca-server)
    - [4.5.5. Creating Key Pairs for the Wallet Server](#455-creating-key-pairs-for-the-wallet-server)
  - [4.6. Generating DID Documents](#46-generating-did-documents)
    - [4.6.1. Creating the DID Document for the TA Server](#461-creating-the-did-document-for-the-ta-server)
    - [4.6.2. Creating the DID Document for the Issuer Server](#462-creating-the-did-document-for-the-issuer-server)
    - [4.6.3. Creating the DID Document for the Verifier Server](#463-creating-the-did-document-for-the-verifier-server)
    - [4.6.4. Creating the DID Document for the CA Server](#464-creating-the-did-document-for-the-ca-server)
    - [4.6.5. Creating the DID Document for the Wallet Server](#465-creating-the-did-document-for-the-wallet-server)
- [5. Installation and Registration](#5-installation-and-registration)
  - [5.1. Step 1: Blockchain Installation](#51-step-1-blockchain-installation)
    - [5.1.1. Installing the Hyperledger Fabric Test Network](#511-installing-the-hyperledger-fabric-test-network)
    - [5.1.2. Deploying the Open DID Chaincode](#512-deploying-the-open-did-chaincode)
  - [5.2. Step 2: TA Server Installation and Registration](#52-step-2-ta-server-installation-and-registration)
    - [5.2.1. TA Server Installation and Launch](#521-ta-server-installation-and-launch)
    - [5.2.2. Registering the TA Server](#522-registering-the-ta-server)
    - [5.2.3. Bulk Entity Registration (For Testing)](#523-bulk-entity-registration-for-testing)
  - [5.3. Step 3: API Gateway Installation](#53-step-3-api-gateway-installation)
    - [5.3.1. API Gateway Server Installation and Launch](#531-api-gateway-server-installation-and-launch)
  - [5.4. Step 4: Entity Servers Installation and Registration](#54-step-4-entity-servers-installation-and-registration)
    - [5.4.1. Issuer Server Installation and Registration](#541-issuer-server-installation-and-registration)
    - [5.4.2. Verifier Server Installation and Registration](#542-verifier-server-installation-and-registration)
    - [5.4.3. CA Server Installation and Registration](#543-ca-server-installation-and-registration)
    - [5.4.4. Wallet Server Installation and Registration](#544-wallet-server-installation-and-registration)
  - [5.5. Step 5: Demo Server Installation](#55-step-5-demo-server-installation)
  - [5.6. Step 6: App Installation](#56-step-6-app-installation)
    - [5.6.1. Android App Installation](#561-android-app-installation)
    - [5.6.2. iOS App Installation](#562-ios-app-installation)
- [6. Testing Guide for the OpenDID Demo Environment](#6-testing-guide-for-the-opendid-demo-environment)
  - [6.1. User Registration Test](#61-user-registration-test)
  - [6.2. VC Issuance Test](#62-vc-issuance-test)
    - [6.2.1. MDL (Mobile Driver License) VC Issuance Test](#621-mdl-mobile-driver-license-vc-issuance-test)
    - [6.2.2. National ID VC Issuance Test](#622-national-id-vc-issuance-test)
  - [6.3. VP Submission Test](#63-vp-submission-test)

  
# 1. Overview

Welcome to the world of Open DID!

In brief, Open DID is a platform that provides a digital identity verification system. The Open DID platform aims to reduce social costs and fulfill its noble mission of "social responsibility for the realization of human value" for those marginalized from infrastructure.

This document guides you through the installation process of Open DID components and the comprehensive verification of its key functions, step by step. By following each chapter in order, you will be able to easily install the Open DID platform.

What features can you check after installing the Open DID platform?

**First,** you can register each component of Open DID (servers, wallets, and users) in a secure and trusted repository. To explain further, using a DID (Decentralized Identifier), information about the components of Open DID is stored on a blockchain repository. A DID is a concept that allows users to manage their identity information independently, without relying on centralized institutions. The blockchain records this information on a decentralized network, ensuring the integrity and security of the data.

<br/>

**Second,** you can issue VCs (Verifiable Credentials) to users. Think of a VC as a digital ID card that you receive online but can also use in real life. Like a student ID or employee badge, a VC can prove the identity or qualifications of the user.

<br/>

**Third,** users can generate and submit a VP (Verifiable Presentation) based on their VC. A VP is a way of presenting only specific information from a VC, allowing users to share minimal and secure information when verifying their identity or qualifications. For example, if a user needs to prove their age, they can use a VP to selectively provide only the age information without exposing their entire identity.

The concepts like DID, VC, and VP might seem unfamiliar at first, but don’t worry. Just by following this document, you will be able to understand and verify the key features of Open DID. These concepts will naturally become familiar as you use the platform.

> **Reference Links**
> - [DID (Decentralized Identifier)](https://www.w3.org/TR/did-core/)
> - [Blockchain](https://en.wikipedia.org/wiki/Blockchain)
> - [VC (Verifiable Credential)](https://www.w3.org/TR/vc-data-model/)
> - [VP (Verifiable Presentation)](https://www.w3.org/TR/vc-data-model/#presentations)

<br/>

Below are the main contents covered in each chapter:

1. **Installation Overview**: Provides a guide to the overall installation process of the Open DID platform.

2. **System Requirements**: Explains the system requirements needed to run the project. 
    - Details the system requirements for installing the components of Open DID (Blockchain, servers, and app).

3. **Prerequisites**: Guides you through the necessary preparations before starting the installation.
    - Instructions on how to install Git.
    - Instructions on how to install Gradle.
    - Instructions on how to install the CLI tool.
    - Explains how to generate Wallet files for each server.
    - Explains how to generate DID Documents for each server.

4. **Installation and Registration**: Describes how to install each component of Open DID and how to register the installed servers within the Open DID system.
    - Explains how to install the blockchain.
    - Describes how to install and register the TA server.
    - Guides on installing the API Gateway server.
    - Details the installation and registration process for the Entity servers (Issuer, Verifier, CA, Wallet).
    - Explains how to install the Demo server.
    - Guides on installing the app (Android, iOS).

<br/><br/>


# 2. Installation Overview

> ⚠️ Note  
> Currently, Open DID servers **officially support only the Orchestrator-based installation method**.  
> Manual server installation and Open DID registration features are **scheduled to be officially supported in June 2024**.  
> Until then, please follow the steps in [2.1. Quick Installation Using Orchestrator](#21-quick-installation-using-orchestrator).


This chapter guides you through the components and installation sequence of the Open DID project.

The Open DID platform must be installed in the specified order to function correctly.

**First,** install the blockchain, which serves as the repository for storing information about Open DID components (servers and apps). The blockchain stores identity information and transaction records for all components in a decentralized network, ensuring data integrity and protection against tampering. It is the core infrastructure that guarantees the reliability of the Open DID platform. Currently, Open DID supports only blockchain as a storage option, but plans to support other forms of storage in the future to increase the platform’s flexibility and adapt to various environments.

**Second,** install the TA (Trust Agent) server, which builds the trust chain by registering component information on the blockchain. The TA server verifies the data requested by components, signs verified data, and registers it on the blockchain. This ensures that only trusted data is stored, and the TA server plays a critical role in establishing this trust chain.

**Third,** install the API Gateway server, which acts as an intermediary between the blockchain and apps that cannot directly interact with the blockchain. Currently, the Open DID platform supports Hyperledger-based private blockchains. Due to the nature of private blockchains, servers can directly access and process data on the blockchain, but apps cannot access the blockchain directly due to security and privacy policies. The API Gateway server resolves this issue by handling data requests and responses between the blockchain and apps. This allows apps to securely access necessary information through the API Gateway server without having to manage the complex blockchain structure or protocols. Additionally, the API Gateway server provides an additional security layer to protect communication between the blockchain and apps.

**Fourth,** install the Entity servers. Entity servers are key components of the Open DID platform, including the Issuer, Verifier, CA, and Wallet servers.

- The Issuer server issues Verifiable Credentials (VCs), providing users with reliable digital identity credentials.
- The Verifier server verifies submitted Verifiable Presentations (VPs), confirming the authenticity of the information and providing trusted authentication.
- The CA (Certificate App) server guarantees the trustworthiness of the app. Before requesting major functions, the app must obtain a token, and the CA server ensures the app’s reliability by allowing it to receive this token.
- The Wallet server ensures the reliability of the wallet held by the app. Wallets used by the app must also be registered on the blockchain, and the Wallet server plays a role in ensuring their trustworthiness during this process.

**Fifth,** install the Demo server. The Demo server is a web server that provides a user interface for testing key Open DID functions, such as VC issuance and VP submission. This allows users to verify the features under conditions similar to a real environment.

**Sixth,** install the apps. The apps are the main interface through which users interact with the Open DID platform, and they are available for both Android and iOS. Users can manage their identity information, issue and store VCs, and create and submit VPs using these apps.


<br/>
The above content can be summarized in the table below.

<br/>

| Component              | Role                                                                                                        | Installation Order |
| ---------------------- | ----------------------------------------------------------------------------------------------------------- | ------------------ |
| **Blockchain**         | Installs the Hyperledger Fabric blockchain and deploys the chaincode.                                       | 1                  |
| **TA Server**          | The Trust Agent server, serving as the central element in establishing trust relationships within Open DID. | 2                  |
| **API Gateway Server** | The API Gateway server mediates data requests from the app to the blockchain.                               | 3                  |
| **Issuer Server**      | The issuing authority server, responsible for issuing VCs (Verifiable Credentials) requested by users.      | 4                  |
| **Verifier Server**    | The verification authority server, verifying VPs (Verifiable Presentations) submitted by users.             | 5                  |
| **CA Server**          | The Certified App server, ensuring that certified apps can be used within the Open DID platform.            | 6                  |
| **Wallet Server**      | The Wallet server, ensuring that wallets can be used within the Open DID platform.                          | 7                  |
| **Demo Server**        | Provides an environment for testing VC issuance and VP submission functionalities.                          | 8                  |
| **Android App**        | The Android client app for the Open DID platform.                                                           | 9                  |
| **iOS App**            | The iOS client app for the Open DID platform.                                                               | 10                 |



<br/>

The above process is illustrated as follows:

```text
+---------------------------------------------------------------+
| 1. Install Blockchain and Deploy Chaincode                    |
|    +------------------------------------------------------+   |
|    | - Install Hyperledger Fabric Test Network            |   |
|    | - Deploy Chaincode                                   |   |
|    +------------------------------------------------------+   |
+---------------------------------------------------------------+
                              |
                              v
+---------------------------------------------------------------+
| 2. Install and Register TA Server                             |
+---------------------------------------------------------------+
                              |
                              v
+---------------------------------------------------------------+
| 3. Install API Gateway                                        |
+---------------------------------------------------------------+
                              |
                              v
+---------------------------------------------------------------+
| 4. Install and Register Entity Server                         |
|    +-----------------------------+                            |
|    | - Issuer Server              |                           |
|    | - Verifier Server            |                           |
|    | - CA Server                  |                           |
|    | - Wallet Server              |                           |
|    +-----------------------------+                            |
+---------------------------------------------------------------+
                              |
                              v
+---------------------------------------------------------------+
| 5. Install Demo Server                                        |
+---------------------------------------------------------------+
                              |
                              v
+---------------------------------------------------------------+
| 6. Install Apps                                               |
|    +-----------------------------+                            |
|    | - Android App                |                           |
|    | - Web Application            |                           |
|    +-----------------------------+                            |
+---------------------------------------------------------------+
```

<br/>

## 2.1. Quick Installation with Orchestrator

Installing Open DID can be complex due to its various components and configurations. For first-time users or those who want to quickly build a test environment, it might feel overwhelming.

To address this, Open DID provides an integrated installation tool called **Orchestrator**.  
Orchestrator allows you to easily install and configure all components through a single web interface.

Orchestrator offers the following features:

- Installation and deployment of the Hyperledger Fabric blockchain
- Installation and initialization of PostgreSQL
- Start / Stop / Status check of each server
- Automatic generation of Wallet files and DID Documents for each server
- Direct access to each server’s Admin page and Swagger UI

### 2.1.1. Installing Orchestrator

Detailed installation instructions for Orchestrator can be found in the separate installation guide.  
Please refer to the document below to proceed with the installation:

> **Reference**
> - [Orchestrator Installation and Operation Guide](https://github.com/OmniOneID/did-orchestrator-server/blob/develop/docs/installation/OpenDID_orchestrator_InstallationAndOperation_Guide_ko.md)

<br/>

### 2.1.2. Installing and Running Servers with Orchestrator

Once Orchestrator is installed, you can use its web UI to install and run each component individually.  
The image below shows the initial Orchestrator screen with the location of key features:

<img src="./images/2-1.orchestrator-main.png" width="800"/>

---

Follow the steps below to install and run servers through Orchestrator:

1. **Install the Blockchain**  
   - In the `Repositories` table, click the **Start** button (①) for the **Hyperledger Fabric** item.  
   - The blockchain will be installed and launched, and the status indicator will turn green.

2. **Install PostgreSQL**  
   - In the `Repositories` table, click the **Start** button (②) for the **PostgreSQL** item.  
   - The database will be installed and launched, and the status indicator will turn green.

3. **Automatically Generate Wallets and DID Documents**  
   - In the `Quick Start` table, click the **Generate All** button (③) for the **All Entities** item.  
   - Wallet files and DID Documents required by each server will be automatically generated.

4. **Install and Start Servers**  
   - In the `Servers` table, click the **Start** button (④~⑨) for each server:
     - (④) `TAS (8090)`
     - (⑤) `Issuer (8091)`
     - (⑥) `Verifier (8092)`
     - (⑦) `CAS (8094)`
     - (⑧) `WalletService (8095)`
     - (⑨) `API (8093)`
   - Each server will be installed and launched, and the status indicator will turn green.

> **Note:**  
> Some servers may take a while during installation or initial launch.  
> If a server's status remains red even after installation, try refreshing the page (F5).

> You can also use the **[Settings]** and **[Swagger]** buttons on the right side of each server entry  
> to directly access the server's Admin console or Swagger documentation.

---

Once all servers are running, the next step is to register each server in the Open DID system using the Admin Console.  
For detailed instructions, refer to [2.1.3 Registering Servers after Orchestrator Installation](#213

<br/>

# 3. System Requirements
This chapter explains the requirements needed to install the Open DID platform. To run the servers and apps, the environment must meet the requirements specified in each section.

## 3.1. Server

- Language: OpenJDK 17
- Framework: Spring Boot 3.2
- Database: PostgreSQL 16.4
- Build and Dependency Management Tool: Gradle 8.8

## 3.2. App

**■ Android**
- Language: OpenJDK 17
- Framework: Android 13.0 (API 33)
- Database: Room 2.2.5
- Build and Dependency Management Tool: Gradle 8.2

**■ iOS**
- Language: Swift 5
- Framework: iOS 15
- Database: Core Data
- Build and Dependency Management Tool: Xcode 15.4 or later, CocoaPods


<br />


# 4. Prerequisites

This chapter guides you through the necessary preparations before installing the components of the Open DID project.

## 4.1. Installing Git

`Git` is a distributed version control system that tracks changes in source code and supports collaboration among multiple developers. Git is essential for managing the source code and versioning of the Open DID project.

Once the installation is successful, you can verify the Git version using the following command:

```bash
git --version
```

Congratulations! You are now ready to download the source code for the Open DID components.

> **Reference Link**
> - [Git Installation Guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

<br/>

## 4.2. Installing Gradle

`Gradle` is a build automation tool that supports various programming languages and platforms. It is required for compiling the server code and managing the necessary libraries for the Open DID components, making these tasks easier to handle.

Once the installation is successful, you can verify the Gradle version using the following command:

```bash
gradle --version
```

Congratulations! You are now ready to build and manage the Open DID server components.

> **Reference Link**
> - [Gradle Installation Guide](https://gradle.org/install/)

<br/>

## 4.3. Installing cli-tool

`cli-tool` is a tool designed to help easily generate Wallets and DID Documents. Before installing the servers in the Open DID platform, it is **mandatory** to use `cli-tool` to create the Wallet and DID Document.

The Wallet stores the server's public and private keys, which are used for signing and verifying data.

A DID Document contains important information related to the Decentralized Identifier (DID). It includes the public key of the DID owner, authentication methods, and service endpoints (e.g., contact information). Other systems or services refer to this document to verify the DID owner’s identity and communicate securely.

The servers in Open DID utilize the DID Document to authenticate securely with other servers or services and to establish trusted communications.

The steps for installing the `cli-tool` are as follows:

1. Use the `git clone` command to copy the cli-tool repository to your local computer.
    ```shell
    git clone https://github.com/OmniOneID/did-cli-tool-server.git
    ```
2. Navigate to the source folder within the cloned repository.
    ```shell
    cd did-cli-tool-server/source/did-cli-tool-server
    ```
3. Build the source using `gradlew`.
    ```shell
    chmod 755 ./gradlew
    ./gradlew clean build
    ```
    > Note
    > - `gradlew` stands for Gradle Wrapper, a script used to run Gradle within the project. Even if Gradle is not installed locally, it automatically downloads and runs the version specified by the project. This ensures that developers can build the project in a consistent environment, regardless of whether Gradle is installed on their system.
4. Move to the build folder and verify that the JAR file has been generated.
    ```shell
    cd build/libs
    ls
    ```
5. Run the generated JAR file to check the current version.
    ```shell
    java -jar did-cli-tool-server-1.0.0.jar --version
    ```
    > **Note**
    > - In this document, we assume that the built JAR file is named 'did-cli-tool-server-1.0.0.jar'.


For more detailed instructions on installing and using the cli-tool, please refer to the link below.

> **Reference Link**
> - [cli-tool guide](https://github.com/OmniOneID/did-cli-tool-server/blob/main/source/did-cli-tool-server/README.md)


<br/>

## 4.4. Creating Wallet Files

Most servers in Open DID must possess a Wallet. The Wallet stores the server's public and private keys, which are used for signing and verifying data. While there are various types of Wallets, currently only file-based Wallets are supported, and these Wallet files can be generated using the cli-tool.

The list of Open DID servers that require a Wallet file is as follows:

| Server              | Wallet Name | Generated Wallet File Name |
| ------------------- | ----------- | ------------------------- |
| **TA Server**       | tas         | tas.wallet                |
| **Issuer Server**   | issuer      | issuer.wallet             |
| **Verifier Server** | verifier    | verifier.wallet           |
| **CA Server**       | cas         | cas.wallet                |
| **Wallet Server**   | wallet      | wallet.wallet             |

> **Note:**
> - The Wallet names are examples for guidance and can be modified to suit the actual environment.

<br/>

To create a Wallet file using the cli-tool, follow the instructions below. Upon successful execution, a `walletName.wallet` file will be created.

```shell
# Execute the command to create the Wallet file:
java -jar did-cli-tool-server-1.0.0.jar walletManager createWallet -m [walletName] -p

# Enter the password:
password
```
> Note
> - The password must be recorded in the server’s configuration file, so be sure to remember it.

<br/>
Sections 4.4.1 to 4.4.5 provide instructions on how to create Wallet files for the Open DID servers using the command above.

<br />

### 4.4.1. Creating the Wallet File for the TA Server

To create the Wallet file for the TA server, use the following command:

```shell
# Execute the command to create the Wallet file:
java -jar did-cli-tool-server-1.0.0.jar walletManager createWallet -m tas -p

# Enter the password:
password
```

  > Note
  > - The password input process will be omitted in the following sections.

<br/>

### 4.4.2. Creating the Wallet File for the Issuer Server

To create the Wallet file for the Issuer server, use the following command:

```shell
java -jar did-cli-tool-server-1.0.0.jar walletManager createWallet -m issuer -p
```

<br/>

### 4.4.3. Creating the Wallet File for the Verifier Server

To create the Wallet file for the Verifier server, use the following command:

```shell
java -jar did-cli-tool-server-1.0.0.jar walletManager createWallet -m verifier -p
```

<br/>

### 4.4.4. Creating the Wallet File for the CA Server

To create the Wallet file for the CA server, use the following command:

```shell
java -jar did-cli-tool-server-1.0.0.jar walletManager createWallet -m cas -p
```

<br/>

### 4.4.5. Creating the Wallet File for the Wallet Server

To create the Wallet file for the Wallet server, use the following command:

```shell
java -jar did-cli-tool-server-1.0.0.jar walletManager createWallet -m wallet -p
```

<br/>


## 4.5. Adding Wallet keys

In Section 4.4, keys for each server will be added to the Wallets created. The list of key IDs that need to be generated for each server is as follows:

| Server              | Wallet Name | Key ID                          |
| ------------------- | ----------- | ------------------------------ |
| **TA Server**       | ta          | assert, auth, invoke, keyagree |
| **Issuer Server**   | issuer      | assert, auth, invoke           |
| **Verifier Server** | verifier    | assert, auth, invoke           |
| **CA Server**       | ca          | assert, auth, invoke           |
| **Wallet Server**   | wallet      | assert, auth, invoke           |

<br/>

The method for adding keys using the cli-tool is as follows. Once the command below is successfully executed, the key pair information will be added to the Wallet file created in Section 4.4.


```shell
# Wallet Key Pair Generation
java -jar [moduleName] walletManager addKey -m [walletName] -i [keyId] -t [keyType] -p [password]
```
<br/>
Sections 4.5.1 to 4.5.5 provide instructions on how to add key pairs to the Wallet files of Open DID servers using the command above.

<br/>

### 4.5.1. Creating Key Pairs for the TA Server

To add key pairs to the Wallet file for the TA server, follow the steps below.

```shell
# Wallet Key Pair Generation
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m tas.wallet -i assert -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m tas.wallet -i auth -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m tas.wallet -i keyagree -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m tas.wallet -i invoke -t 1 -p 
```

<br/>

### 4.5.2. Creating Key Pairs for the Issuer Server

To add key pairs to the Wallet file for the Issuer server, follow the steps below.

```shell
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m issuer.wallet -i assert -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m issuer.wallet -i auth -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m issuer.wallet -i keyagree -t 1 -p
```

<br/>

### 4.5.3. Creating Key Pairs for the Verifier Server

To add key pairs to the Wallet file for the Verifier server, follow the steps below.

```shell
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m verifier.wallet -i assert -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m verifier.wallet -i auth -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m verifier.wallet -i keyagree -t 1 -p
```

<br/>

### 4.5.4. Creating Key Pairs for the CA Server

To add key pairs to the Wallet file for the CA server, follow the steps below.

```shell
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m cas.wallet -i assert -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m cas.wallet -i auth -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m cas.wallet -i keyagree -t 1 -p
```

<br/>

### 4.5.5. Creating Key Pairs for the Wallet Server

To add key pairs to the Wallet file for the Wallet server, follow the steps below.

```shell
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m wallet.wallet -i assert -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m wallet.wallet -i auth -t 1 -p
java -jar did-cli-tool-server-1.0.0.jar walletManager addKey -m wallet.wallet -i keyagree -t 1 -p
```

<br/>


## 4.6. Generating DID Documents

Most servers in Open DID require the DID Document to be registered on the blockchain.

DID Documents can be generated using the cli-tool, and the Wallet file must already be created beforehand.

| Server              | Wallet File Name  | Generated DID Document File Name |
| ------------------- | ----------------- | -------------------------------- |
| **TA Server**       | tas.wallet        | tas.did                          |
| **Issuer Server**   | issuer.wallet     | issuer.did                       |
| **Verifier Server** | verifier.wallet   | verifier.did                     |
| **CA Server**       | cas.wallet        | cas.did                          |
| **Wallet Server**   | wallet.wallet     | wallet.did                       |

> **Note:**
> - The DID Document names are examples for guidance and can be modified to suit the actual environment.

<br/>

The method for generating a DID Document using the cli-tool is as follows. Once the command below is successfully executed, a `didName.did` file will be created.

```shell
# Generate DID Document file:
java -jar [moduleName] did createDid -m [walletName] -f [didName] -id [didId] -ci [controller] -mi [assertionKeyList] -ai [authenticationKeyList] -ki [keyAgreementKeyList] -ii [invocationKeyList] -p
```

<br/>

Sections 4.6.1 to 4.6.5 provide instructions on how to create DID Document files for the Open DID servers using the command above.

<br/>

### 4.6.1. Creating the DID Document for the TA Server

To create the DID Document for the TA server, use the following command:

```shell
java -jar did-cli-tool-server-1.0.0.jar did createDid -m tas.wallet -f tas.did -id did:omn:tas -ci did:omn:tas -mi assert -ai auth -ki keyagree -ii invoke -p
```

<br/>

### 4.6.2. Creating the DID Document for the Issuer Server

To create the DID Document for the Issuer server, use the following command:

```shell
java -jar did-cli-tool-server-1.0.0.jar did createDid -m issuer.wallet -f issuer.did -id did:omn:issuer -ci did:omn:tas -mi assert -ai auth -ki keyagree -p
```

<br/>

### 4.6.3. Creating the DID Document for the Verifier Server

To create the DID Document for the Verifier server, use the following command:

```shell
java -jar did-cli-tool-server-1.0.0.jar did createDid -m verifier.wallet -f verifier.did -id did:omn:verifier -ci did:omn:tas -mi assert -ai auth -ki keyagree -p
```

<br/>

### 4.6.4. Creating the DID Document for the CA Server

To create the DID Document for the CA server, use the following command:

```shell
java -jar did-cli-tool-server-1.0.0.jar did createDid -m cas.wallet -f cas.did -id did:omn:cas -ci did:omn:tas -mi assert -ai auth -ki keyagree -p
```

<br/>

### 4.6.5. Creating the DID Document for the Wallet Server

To create the DID Document for the Wallet server, use the following command:

```shell
java -jar did-cli-tool-server-1.0.0.jar did createDid -m wallet.wallet -f wallet.did -id did:omn:wallet -ci did:omn:tas -mi assert -ai auth -ki keyagree -p
```

<br/>


# 5. Installation and Registration

This chapter explains how to install each component of Open DID and register the installed servers within the Open DID system.

'Registration in the Open DID System' refers to the process of creating a DID Document for the installed server, registering it on the blockchain, and then obtaining a joining certificate through the TA server. This process is essential to ensure the server's reliability within the Open DID system and is necessary for secure communication and authentication. The joining certificate is issued as a VC (Verifiable Credential) signed by the TA, indicating that the server is a trusted entity guaranteed by the TA server within the Open DID system.

The list of servers that require 'Registration in the Open DID System' is as follows:

| Server                 | Registration in Open DID System Required |
| ---------------------- | ---------------------------------------- |
| **TA Server**          | Yes                                      |
| **Issuer Server**      | Yes                                      |
| **Verifier Server**    | Yes                                      |
| **CA Server**          | Yes                                      |
| **Wallet Server**      | Yes                                      |
| **API Gateway Server** | No                                       |
| **Demo Server**        | No                                       |

> **Note:**
> - During the registration process, a Swagger interface is provided to easily call the APIs of each server.
> - The Swagger URL is [server address]/swagger-ui/index.html.

<br/>

## 5.1. Step 1: Blockchain Installation

Open DID supports Hyperledger Fabric as its blockchain technology. To install Hyperledger Fabric and deploy the chaincode, the following steps must be followed:

1. Install the Hyperledger Fabric test network
2. Deploy the Open DID chaincode

<br/>

### 5.1.1. Installing the Hyperledger Fabric Test Network

The Hyperledger Fabric test network is a preset network provided to easily set up a blockchain environment locally for testing and development. This network mimics a real operational environment, allowing for safe testing of chaincode deployment and transaction validation.

The test network helps set up and run the main components of Hyperledger Fabric, including peers, ordering services, and CA services, locally with ease. This enables developers to conveniently deploy and test blockchain applications.

Open DID, based on Hyperledger Fabric, records and verifies data on the blockchain network. The test network serves as a fundamental step for easily building such an environment, making it valuable for development and testing purposes.

> **Reference Link**
> - [Hyperledger Fabric Test Network](https://hyperledger-fabric.readthedocs.io/en/latest/getting_started.html)

<br/>

### 5.1.2. Deploying the Open DID Chaincode

Deploying the Open DID chaincode involves installing the Open DID-related smart contracts on the Hyperledger Fabric blockchain network. This process registers the chaincode on the blockchain network and configures it for use within the network.

For more detailed deployment instructions, please refer to the link below.

> **Reference Link**
> - [did-fabric-contract guide](https://github.com/OmniOneID/did-fabric-contract/blob/main/source/did-fabric-contract/README.md)

> **Note:**
> When running the test network and deploying the chaincode, make sure to enter the chaincode name as `opendid`.
> This chaincode name must then be configured in each server's blockchain settings file.

<br/>


## 5.2. Step 2: TA Server Installation and Registration

The TA server is the Trust Agent Service server and plays a central role in establishing trust relationships between servers and users within Open DID. The installation and registration process of the TA server within the Open DID system is as follows.

<br/>

### 5.2.1. TA Server Installation and Launch

This process involves copying the TA server repository to the user's local computer, completing the necessary configurations for server operation, and launching the server. For more detailed installation instructions, please refer to the link below.

In this guide, we assume the TA server's access address is 'http://192.168.1.1:8090'.

> **Reference Link**
> - [Open DID TA Server Installation And Operation Guide](https://github.com/OmniOneID/did-ta-server/blob/main/docs/installation/OpenDID_TASServer_InstallationAndOperation_Guide.md)

<br/>

### 5.2.2. Registering the TA Server

This section covers how to register the TA server's DID Document on the blockchain and **self-issue the joining certificate VC**.  
Please follow the steps below:

1. Open a web browser and access the TA Admin Console.  
   - URL: `http://192.168.1.1:8090`

2. On the login page, log in with the following credentials:  
   - ① Email: `admin@opendid.omnione.net`  
   - ② Password: `omnioneopendid12!@`  
   - ③ Click the **[SIGN IN]** button to log in.  
   <img src="./images/5-1.ta-login.png" width="400"/>

3. On the main screen, confirm that you have navigated to the **TA Registration** menu.

4. On the **Trust Agent Quick Registration** screen, enter the following information:  
   - ① **Server URL**: `http://192.168.1.1:8090/tas`  
   - ② Click the **[QUICK REGISTER]** button.  
   <img src="./images/5-2.ta-registration.png" width="800"/>

> ⚠️ ***Quick Register*** is a temporary feature.  
> Full TA registration involves multiple steps and is planned to be officially released in June.

5. When the success popup appears, click the **OK** button.

6. Navigate to the **TA Management** menu and verify that the registered TA information is displayed.  
   <img src="./images/5-3.ta-management.png" width="600"/>

<br/>

### 5.2.3. Bulk Entity Registration (For Testing)

> **Note:**  
> This procedure assumes you are using the **Orchestrator environment**.  
> To use the bulk entity registration feature, you must first **install and run all servers using Orchestrator**  
> and use the `Generate All` feature to pre-generate DID Documents and Wallet files for each server.  
> For details, refer to the [2.1. Quick Installation with Orchestrator](#21-quick-installation-with-orchestrator) section.

---

Most Entity servers are registered in the Open DID system through the TA server.  
In a production environment, the following **formal registration process** should be followed:

1. The **Entity administrator** creates the DID Document from the Entity Admin page.  
2. The DID Document is **sent to the TA Admin for blockchain registration**.  
3. The **TA administrator** approves the request and **registers the DID Document on the blockchain**.  
4. The Entity administrator **requests issuance of the joining certificate (VC)** to complete the registration in Open DID.

---

In a test environment, you can use the **[Bulk Register Entities]** feature provided by the TA Admin.  
This feature automatically performs the following actions for all Entity servers:
- Registers each Entity’s DID Document on the blockchain
- Issues the joining certificate
- Delivers the certificate to each Entity server

---

Follow the steps below to perform bulk entity registration:

1. Open a web browser and access the TA Admin Console.  
2. Log in using the admin credentials.  
3. Click on the **Entity Management** menu in the sidebar.  
4. Click the **[QUICK REGISTER]** button.  
   <img src="./images/5-4.entity-management.png" width="600"/>

5. Once registration is complete, verify that Issuer, Verifier, Wallet, and CA information has been added to the table.  
   <img src="./images/5-5.entity-management-after-quick.png" width="600"/>

> ⚠️ Please note: The **Bulk Entity Registration** feature is for testing purposes only.  
> In a production environment, you must follow the official registration process.

<br/>

## 5.3. Step 3: API Gateway Installation

The API Gateway Server acts as a mediator, allowing the app to retrieve specific data from the blockchain server. It does not need to be registered within the Open DID system. The installation process for the API Gateway Server is as follows:

### 5.3.1. API Gateway Server Installation and Launch

This involves copying the API Gateway Server repository to the user's local computer, completing the necessary configurations for server operation, and launching the server. For more detailed installation instructions, please refer to the link below.

> **Reference Link**
> - [Open API Gateway Server Installation And Operation Guide](https://github.com/OmniOneID/did-api-server/blob/main/docs/installation/OpenDID_APIGatewayServer_InstallationAndOperation_Guide.md)

<br/>


## 5.4. Step 4: Entity Servers Installation and Registration

Entities refer to the components in the Open DID system that perform specific roles. The components of Open DID include the Issuer, Verifier, CA, Wallet, and API Gateway. Except for the API Gateway Server, all Entity servers must go through the same registration process as the TA server.

### 5.4.1. Issuer Server Installation and Registration

The Issuer server acts as the issuing authority, responsible for issuing VCs (Verifiable Credentials) to users.
The installation and registration process of the Issuer server within the Open DID system is as follows:

#### 5.4.1.1. Issuer Server Installation and Launch

This process involves copying the Issuer server repository to the user's local computer, completing the necessary configurations for server operation, and launching the server. For more detailed installation instructions, please refer to the link below.

In this guide, we assume the Issuer server's access address is 'http://192.168.1.1:8091'.

> **Reference Link**
> - [Open DID Issuer Server Installation And Operation Guide](https://github.com/OmniOneID/did-issuer-server/blob/main/docs/installation/OpenDID_IssuerServer_InstallationAndOperation_Guide.md)

<br/>

#### 5.4.1.2. Registering the DID Document of the Issuer Server

This feature is currently under development and is **scheduled to be updated in June 2025**.  
Until the official release, please register the Issuer server using the procedure described in  
[5.2.3. Bulk Entity Registration (For Testing)](#523-bulk-entity-registration-for-testing).

<br/>

#### 5.4.1.3. Issuing the Joining Certificate for the Issuer Server

This feature is currently under development and is **scheduled to be updated in June 2025**.  
Until the official release, please register the Issuer server using the procedure described in  
[5.2.3. Bulk Entity Registration (For Testing)](#523-bulk-entity-registration-for-testing).

<br/>

### 5.4.2. Verifier Server Installation and Registration

The Verifier server acts as the verification authority, responsible for validating VPs (Verifiable Presentations) submitted by users. The installation and registration process of the Verifier server within the Open DID system is as follows:

#### 5.4.2.1. Verifier Server Installation and Launch

This process involves copying the Verifier server repository to the user's local computer, completing the necessary configurations for server operation, and launching the server. For more detailed installation instructions, please refer to the link below.

In this guide, we assume the Verifier server's access address is 'http://192.168.1.1:8092'.

> **Reference Link**
> - [Open DID Verifier Server Installation And Operation Guide](https://github.com/OmniOneID/did-verifier-server/blob/main/docs/installation/OpenDID_VerifierServer_InstallationAndOperation_Guide.md)

<br/>

#### 5.4.2.2. Registering the DID Document of the Verifier Server

This feature is currently under development and is **scheduled to be updated in June 2025**.  
Until the official release, please register the Verifier server using the procedure described in  
[5.2.3. Bulk Entity Registration (For Testing)](#523-bulk-entity-registration-for-testing).

<br/>

#### 5.4.2.3. Issuing the Joining Certificate for the Verifier Server

This feature is currently under development and is **scheduled to be updated in June 2025**.  
Until the official release, please register the Verifier server using the procedure described in  
[5.2.3. Bulk Entity Registration (For Testing)](#523-bulk-entity-registration-for-testing).

<br/>


### 5.4.3. CA Server Installation and Registration

The CA server acts as the Certified App server, ensuring that certified apps can be used within the Open DID platform. The installation and registration process of the CA server within the Open DID system is as follows.

#### 5.4.3.1. CA Server Installation and Launch

This process involves copying the CA server repository to the user's local computer, completing the necessary configurations for server operation, and launching the server. For more detailed installation instructions, please refer to the link below.

In this guide, we assume the CA server's access address is 'http://192.168.1.1:8094'.

> **Reference Link**
> - [Open DID CA Server Installation And Operation Guide](https://github.com/OmniOneID/did-ca-server/blob/main/docs/installation/OpenDID_CAServer_InstallationAndOperation_Guide.md)

<br/>

#### 5.4.3.2. Registering the DID Document of the CA Server

This feature is currently under development and is **scheduled to be updated in June 2025**.  
Until the official release, please register the CA server using the procedure described in  
[5.2.3. Bulk Entity Registration (For Testing)](#523-bulk-entity-registration-for-testing).

<br/>

#### 5.4.3.3. Issuing the Joining Certificate for the CA Server

This feature is currently under development and is **scheduled to be updated in June 2025**.  
Until the official release, please register the CA server using the procedure described in  
[5.2.3. Bulk Entity Registration (For Testing)](#523-bulk-entity-registration-for-testing).

<br/>


### 5.4.4. Wallet Server Installation and Registration

The Wallet server ensures that user wallets can be utilized within the Open DID platform. The installation and registration process of the Wallet server within the Open DID system is as follows.

#### 5.4.4.1. Wallet Server Installation and Launch

This process involves copying the Wallet server repository to the user's local computer, completing the necessary configurations for server operation, and launching the server. For more detailed installation instructions, please refer to the link below.

In this guide, we assume the Wallet server's access address is 'http://192.168.1.1:8095'.

> **Reference Link**
> - [Open DID Wallet Server Installation And Operation Guide](https://github.com/OmniOneID/did-wallet-server/blob/main/docs/installation/OpenDID_WalletServer_InstallationAndOperation_Guide.md)

<br/>

#### 5.4.4.2. Registering the DID Document of the Wallet Server

This feature is currently under development and is **scheduled to be updated in June 2025**.  
Until the official release, please register the Wallet server using the procedure described in  
[5.2.3. Bulk Entity Registration (For Testing)](#523-bulk-entity-registration-for-testing).

<br/>

#### 5.4.4.3. Issuing the Joining Certificate for the Wallet Server

This feature is currently under development and is **scheduled to be updated in June 2025**.  
Until the official release, please register the Wallet server using the procedure described in  
[5.2.3. Bulk Entity Registration (For Testing)](#523-bulk-entity-registration-for-testing).

<br/>


## 5.5. Step 5: Demo Server Installation

The Demo server is a web server that provides a user interface for testing the core functions of Open DID, such as VC issuance and VP submission. This allows users to verify these features under conditions similar to a real environment. The installation and registration process for the Demo server within the Open DID system is as follows.

#### 5.5.1. Demo Server Installation and Launch

This process involves copying the Demo server repository to the user's local computer, completing the necessary configurations for server operation, and launching the server. For more detailed installation instructions, please refer to the link below.

In this guide, we assume the Demo server's access address is 'http://192.168.1.1:8099'.

> **Reference Link**
> - [Open DID Demo Server Installation And Operation Guide](https://github.com/OmniOneID/did-demo-server/blob/main/docs/installation/OpenDID_DemoServer_InstallationAndOperation_Guide.md)

<br/>


## 5.6. Step 6: App Installation

The OpenDID app can be set up and installed for two platforms: Android and iOS.

### 5.6.1. Android App Installation

This process involves copying the Android app repository to the user's local computer, completing the necessary configurations for the app to run, and installing the app. For more detailed installation instructions, please refer to the link below.

> **Reference Link**
> - [Open DID Android App Build Guide](https://github.com/OmniOneID/did-client-sdk-aos/blob/main/README.md)

<br/>

### 5.6.2. iOS App Installation

This process involves copying the iOS app repository to the user's local computer, completing the necessary configurations for the app to run, and installing the app. For more detailed installation instructions, please refer to the link below.

> **Reference Link**
> - [Open DID iOS App Build Guide](https://github.com/OmniOneID/did-client-sdk-ios/blob/main/README.md)

<br/>


# 6. Testing Guide for the OpenDID Demo Environment

This chapter explains how to test the core features using the OpenDID demo environment. The testing sequence is as follows:

1.  User Registration Test
       - Test the creation of the Wallet's DID Document and its registration in the Open DID system through the app.
       - Test the creation of the user's DID Document and its registration in the Open DID system through the app.
2.  VC (Verifiable Credential) Issuance Test
      - Start a VC issuance test from the demo server to receive an MDL (Driver's License) VC.
      - Start a VC issuance test from the app to receive a National ID VC.
3.  VP (Verifiable Presentation) Submission
      - Test the process where the app receives a VP submission request from the demo server, generates the VP, and submits it.

<br/>


## 6.1. User Registration Test

1. Launch the `DID CA` app.
   
2. The message 'setting up your wallet' appears, and the app automatically creates and registers the wallet in the OpenDID system. This process is completed automatically, and the wallet registration is finalized without any user input.

   <img src="./images/user_register_1.jpg" width="200" height="400" />

3. The 'Open DID Wallet' screen appears, guiding the user through the registration steps. Confirm that Step 1 is in progress and click the `Next` button.

   <img src="./images/user_register_2.jpg" width="200" height="400"/>

4. The 'User Information' screen appears, prompting the user to enter their information. The input fields are `First Name` and `Last Name`, which are used as follows:
   - They are used as a salt when generating the user's PII.
   - They are displayed as the user's information when showing the issued VC on the app.

   <img src="./images/user_register_3.jpg" width="200" height="400"/>

5. Enter the user information and click the `Save` button.
   
6. A popup with the message 'Would you like to set the Wallet for lock type?' appears, asking if you want to set the wallet to lock mode. Click the `YES` button.

   <img src="./images/user_register_4.jpg" width="200" height="400"/>

7. The message 'Please register a Lock/Unlock PIN' appears, showing a screen to input a wallet lock PIN. Enter a 6-digit number, then enter the same 6-digit number again for confirmation.

   <img src="./images/user_register_5.jpg" width="200" height="400"/>

8. The 'User Information' screen appears, confirming that Step 2 is in progress. Click the `Next` button.

   <img src="./images/user_register_6.jpg" width="200" height="400"/>

9. The message 'Please register a PIN' appears, showing a screen to register a PIN. Enter a 6-digit number, then enter the same 6-digit number again for confirmation.

   <img src="./images/user_register_7.jpg" width="200" height="400"/>

10. A popup with the message 'Would you like to register additional fingerprints?' appears, asking if you want to register additional fingerprints. Click the `YES` button.

    <img src="./images/user_register_8.jpg" width="200" height="400"/>

11. The message 'please input a Lock/Unlock PIN' appears, showing a screen to confirm the PIN. Enter a 6-digit number, then enter the same 6-digit number again for confirmation.

    <img src="./images/user_register_9.jpg" width="200" height="400"/>

12. A fingerprint registration popup appears in the app OS. Register your fingerprint.
   
13. The 'User Information' screen appears, confirming that Step 3 is in progress. Click the `Next` button.

    <img src="./images/user_register_10.jpg" width="200" height="400"/>

14. The message 'Please input a PIN' appears, showing a screen to input the PIN key. Enter a 6-digit number.

    <img src="./images/user_register_11.jpg" width="200" height="400"/>

15. A fingerprint input popup appears in the app OS. Register your fingerprint.

16. After navigating to the main page, confirm that no VC has been issued yet. The message 'No certificate has been issued.' is displayed on the screen.
   
    <img src="./images/user_register_12.jpg" width="200" height="400"/>

<br/>


## 6.2. VC Issuance Test

### 6.2.1. MDL (Mobile Driver License) VC Issuance Test

1. Access the main page of the demo server using a web browser. (http://192.168.1.1:8099/home)

   <img src="./images/mdl_vc_issue_1.png" height="400"/>

2. Click the `Enter Information` button.
   - Enter the same `User Information` as provided in the [6.1 User Registration Test](#61-user-registration-test) section.
     - If the information does not match, the MDL VC issuance will fail.
   - Enter the `Identification information`.

   <img src="./images/mdl_vc_issue_2.png" height="400"/>

3. Click the `Save` button to save the user information.
   - The saved data will be used for MDL VC issuance, and you can skip this step in future tests.

4. Click the `VC issuance` button.

   <img src="./images/mdl_vc_issue_3.png" height="400"/>

5. Click the `Issuance of ID card` button.
6. A 'Issue with QR' popup appears, displaying a QR code on the screen.

   <img src="./images/mdl_vc_issue_4.png" height="400"/>

7. Launch the `DID CA` app.
8. If the wallet is set to lock mode, a PIN input screen will appear. Enter the 6-digit PIN to unlock.

   <img src="./images/mdl_vc_issue_5.jpg" height="400"/>

9. Click the `SCAN QR` button at the bottom of the screen.

   <img src="./images/mdl_vc_issue_6.jpg" height="400"/>

10. When the camera screen activates, scan the QR code.
11. The 'Issuance certificate Information' screen appears, displaying the information of the VC to be issued. Click the `OK` button.

   <img src="./images/mdl_vc_issue_7.jpg" height="400"/>

12. Perform user authentication using fingerprint verification or by entering the PIN on the 'Please input a PIN' screen.
  
13. A 'Success' message appears, confirming that the VC issuance was successful. Click the `OK` button.

   <img src="./images/mdl_vc_issue_8.jpg" height="400"/>

14. Return to the main page and confirm that the issued MDL VC is displayed on the screen.

   <img src="./images/mdl_vc_issue_9.jpg" height="400"/>

15. Click the MDL VC to view detailed claim information.

   <img src="./images/mdl_vc_issue_10.jpg" height="400"/>

16. On the demo server's 'Issue with QR' popup, click the `Check issuance` button.
17. A 'Mobile ID Issued Successfully' alert window appears. Click the `확인` button.
18. The popup displays the message 'The issuance of the mobile ID has been completed,' confirming that the MDL VC issuance was successfully completed.

   <img src="./images/mdl_vc_issue_11.png" height="400"/>

<br/>


### 6.2.2. National ID VC Issuance Test

1. Launch the `DID CA` app.
2. If the wallet is set to lock mode, a PIN input screen will appear. Enter the 6-digit PIN to unlock.<br/>
   <img src="./images/issuer_register_1.jpg" width="200" height="400"/>

3. Click the `ADD VC` button at the bottom of the screen.<br/>
   <img src="./images/issuer_register_2.jpg" width="200" height="400"/>

4. The 'Add Verifiable Credentials' screen appears, allowing you to select the VC to issue. Currently, only the National ID VC is available. Select `National ID Plan`.<br/>
   <img src="./images/issuer_register_3.jpg" width="200" height="400"/>

5. The 'Issuance certificate Information' screen appears, showing the details of the VC to be issued. Click the `OK` button.<br/>
   <img src="./images/issuer_register_4.jpg" width="200" height="400"/>

6. The 'Identification Information' screen appears, allowing you to enter the data for the National ID VC. You need to input Birthdate, Address, License Number, and Issue Date. No specific format is required. After entering all VC data, click the `Save` button.<br/>
   <img src="./images/issuer_register_5.jpg" width="200" height="400"/>

7. The message 'Please input a PIN' appears, and a screen prompts you to enter the PIN. Enter the 6-digit number.<br/>
   <img src="./images/issuer_register_6.jpg" width="200" height="400"/>

8. A 'Success' message appears, confirming that the VC issuance was successful. Click the `OK` button.<br/>
   <img src="./images/issuer_register_7.jpg" width="200" height="400"/>

9. Return to the main page and confirm that the issued National ID VC is displayed. Click on the National ID VC.<br/>
   <img src="./images/issuer_register_8.jpg" width="200" height="400"/>

10. Confirm that the detailed claims of the National ID VC are displayed on the screen.<br/>
    <img src="./images/issuer_register_9.jpg" width="200" height="400"/>

<br/>


## 6.3. VP Submission Test

1. Access the main page of the demo server using a web browser. (http://192.168.1.1:8099/home)

   <img src="./images/vp_submit_1.png" height="400"/>

2. Click the `VP Submission` button.
3. Click the `Submit your ID` button.

   <img src="./images/vp_submit_2.png" height="400"/>

4. A 'Submit a certificate' popup appears, displaying a QR code on the screen.

   <img src="./images/vp_submit_3.png" height="400"/>

5. Launch the `DID CA` app.
   
6. If the wallet is set to lock mode, a PIN input screen will appear. Enter the 6-digit PIN.

   <img src="./images/vp_submit_4.jpg" width="200" height="400"/>

7. Click the `SCAN QR` button at the bottom of the screen.

   <img src="./images/vp_submit_5.jpg" width="200" height="400"/>

8. When the camera screen activates, scan the QR code.
9. The 'Certificate submission guide' screen appears, displaying the information of the issued VC and a list of requested claims at the bottom.

   <img src="./images/vp_submit_6.jpg" width="200" height="400"/>

10. Click the `OK` button. 
11. The 'Select submission verification method' screen appears. Choose either PIN or BIO and proceed with the authentication method accordingly.

   <img src="./images/vp_submit_7.jpg" width="200" height="400"/>

12. Once the submission process is completed in the app, a success screen appears. Click the `OK` button.

   <img src="./images/vp_submit_8.jpg" width="200" height="400"/>

13. In the web browser, click the `Submission Complete` button to verify the successful submission.
14. If the submission is successful, an 'ID submission completed.' alert window appears. Click the confirmation button.
15. The 'Submission of certificate completed' message appears, displaying the submitted claim information.

   <img src="./images/vp_submit_9.png" height="400"/>

<!-- References -->
[TAS API]: https://github.com/OmniOneID/did-ta-server/blob/main/docs/api/TAS_API_ko.md