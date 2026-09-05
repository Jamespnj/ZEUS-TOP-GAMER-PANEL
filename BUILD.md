# Build commands for ZEUS TOP GAMER PANEL

## Build APK for Android

To build a release APK:

```bash
# Navigate to project root
cd ZEUS-TOP-GAMER-PANEL

# Get dependencies
flutter pub get

# Build release APK
flutter build apk --release

# The APK will be generated at:
# build/app/outputs/apk/release/app-release.apk
```

## Build App Bundle for Google Play

```bash
flutter build appbundle --release

# Generated at:
# build/app/outputs/bundle/release/app-release.aab
```

## Build iOS App

```bash
flutter build ios --release
```

## Debug Build (Testing)

```bash
flutter build apk --debug

# Generated at:
# build/app/outputs/apk/debug/app-debug.apk
```

## Install APK on Connected Device

```bash
flutter install

# Or manually with adb:
adb install build/app/outputs/apk/release/app-release.apk
```

## Troubleshooting Build Issues

### Gradle Build Error
```bash
flutter clean
flutter pub get
flutter build apk --release
```

### Insufficient Storage
- Ensure at least 2GB free space on disk
- Clean Flutter cache: `flutter clean`

### Gradle Daemon Timeout
```bash
flutter build apk --release --verbose
```

---

**Build Output:**
- Debug APK: `build/app/outputs/apk/debug/app-debug.apk`
- Release APK: `build/app/outputs/apk/release/app-release.apk`
- App Bundle: `build/app/outputs/bundle/release/app-release.aab`
