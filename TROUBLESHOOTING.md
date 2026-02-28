# Project OmniCare: Development & CI/CD Logs

This document serves as a technical post-mortem for the OmniCare project, highlighting critical implementation hurdles and their architectural resolutions.

---

### 1. Automation Infrastructure (GitHub Actions)
*   **Workflow Invisibility**: Initial YAML files used a dot-prefix (`.github/workflows/.yaml`), preventing GitHub from identifying the workflow.
*   **Resolution**: Standardized naming to `release.yml` for reliable trigger execution.

### 2. Environment Parity (Flutter/Dart SDK)
*   **Language Mismatch**: Development utilized Dart 3.7+ features (e.g., enum dot-shorthands), causing syntax errors in standard CI runners (Flutter 3.19).
*   **Resolution**: Synchronized CI environment to **Flutter 3.41.2** (Stable) to restore language feature compatibility.

### 3. Dependency Management (The ^ Trap)
*   **Versioning Conflict**: Caret constraints (`^`) in `pubspec.yaml` introduced breaking package versions incompatible with older SDKs.
*   **Resolution**: Implemented **Version Pinning** and tightened SDK constraints to `^3.10.1`, ensuring deterministic builds across environments.

### 4. Android Platform Compliance
*   **V2 Embedding**: Modern plugins (e.g., `flutter_native_splash`) failed due to legacy Android V1 metadata and generated code.
*   **NullPointerExceptions**: Build failures occurred when `local.properties` values were missing during release compilation.
*   **Resolution**: 
    - Migrated to Android V2 Embedding in `AndroidManifest.xml`.
    - Implemented safe fallback values for `minSdk`, `targetSdk`, and `compileSdk` in `build.gradle.kts`.

### 5. Gradle Evolution (AGP 9+)
*   **DSL Incompatibility**: The transition to Android Gradle Plugin 9+ introduced breaking changes in output property snapshotting.
*   **Resolution**: Opted out of the new DSL by setting `android.newDsl=false` in `gradle.properties` to maintain plugin stability.

### 6. Multi-Platform Orchestration
*   **Build Failures**: Windows jobs were failing due to a missing `windows/` platform directory in the repository.
*   **Resolution**: Used `flutter create --platforms=windows .` to generate official boilerplates and integrated a `windows-latest` runner into the CI matrix.

### 7. Deployment & Artifacts
*   **Vercel Integration**: Deployment failed due to incorrect `VERCEL_ORG_ID` and `VERCEL_PROJECT_ID` secrets.
*   **User Experience**: Combined artifact zips were inefficient for quick testing.
*   **Resolution**: 
    - Implemented separate artifact upload steps for **Android APK**, **Web ZIP**, and **Windows EXE**.
    - Standardized SPA routing via `vercel.json` for live previews.

---

### 💡 Core Engineering Principles Applied
*   **Environment-First Design**: Ensure CI environments strictly match development SDKs.
*   **Robust Configuration**: Always provide fallback values for platform-specific properties.
*   **Atomic Artifacts**: Deliver individual builds for faster testing cycles.
