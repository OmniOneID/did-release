# CI/CD Pipeline Guide

This document explains how to set up a CI/CD pipeline using GitHub Actions. CI focuses on building the project and running tests, while CD handles packaging and deploying JAR files. This pipeline is automatically triggered after a Pull Request is approved.

## Prerequisites

Before setting up the pipeline, ensure the following:
1. A project repository is prepared on GitHub.
2. The project has defined test and build processes.
3. You have permission to set up GitHub Actions.

## GitHub Actions Creation and Execution Process

### Step 1: Create CI GitHub Action

1. Create a new GitHub Actions workflow file at the path `.github/workflows/` within the repository.(e.g., ci.yml)
2. Define a CI pipeline that triggers when a Pull Request is created in this file.

### Step 2: Create CD GitHub Action

1. Create another workflow file at the path `.github/workflows/` within the repository. (e.g., cd.yml)
2. Define a CD pipeline that triggers when a Release version is created and merged into the main branch in this file.

### Step 3: CI Process on Pull Request Submission

1. Create Pull Request
   - Create a Pull Request to merge changes into the `develop` branch.

2. Automatic CI Execution
   - When the Pull Request is submitted, GitHub Actions automatically triggers the CI process.
   - Use Gradle to build the project, execute defined test cases, and output the results.

3. Pull Request Approval
   - Team members review and approve the PR. This step ensures that code quality and functionality are adequate.

### Step 4: CD Process for Release Version

1. Create Release Branch for QA Validation
   - Create a Release branch for QA validation and perform QA checks on that branch.

2. Automatic CD Execution
   - When the QA validation is completed and the Release branch is merged into the `main` branch, the CD process is automatically triggered.
   - Generate the final deployment file, automatically create a new Release with version information recorded along with the Release Note.
   - Upload the generated deployment file to GitHub Releases.

This setup ensures that code is automatically tested and deployed after each PR merge. The workflows use GitHub Actions to perform CI/CD and automatically upload the deployment files to GitHub Releases, allowing developers to manage and deploy code more efficiently.
