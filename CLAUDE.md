# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
Revoluna is a Flutter mobile application built with FlutterFlow that appears to be a medical staffing platform connecting healthcare professionals with job opportunities. The app uses Supabase as the primary backend service and Firebase for cloud functions and messaging.

## Common Development Commands

### Flutter Commands
- `flutter run` - Run the app in debug mode
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app
- `flutter build web` - Build web version
- `flutter test` - Run tests
- `flutter analyze` - Analyze code for issues
- `flutter clean` - Clean build artifacts
- `flutter pub get` - Install dependencies
- `flutter pub upgrade` - Upgrade dependencies

### Firebase Functions
- `cd firebase/functions && npm run serve` - Start local Firebase emulator
- `cd firebase/functions && npm run lint` - Lint Firebase functions
- `cd firebase/functions && firebase -P revoluna functions:deploy` - Deploy functions

### Testing
- `flutter test` - Run widget tests
- Tests are located in the `test/` directory

## Architecture Overview

### FlutterFlow Structure
- This is a FlutterFlow-generated project with custom code extensions
- Core FlutterFlow files are in `lib/flutter_flow/`
- Custom code additions are in `lib/custom_code/`
- Pages follow FlutterFlow's model/widget pattern

### Backend Services
- **Supabase**: Primary database and authentication (hxgbaruenomkfeeafmff.supabase.co)
- **Firebase**: Cloud functions, messaging, and Firestore for some features
- Database tables are defined in `lib/backend/supabase/database/tables/`

### Key Directories
- `lib/pages/` - UI pages (login, cadastro, nav, other)
- `lib/components/` - Reusable UI components
- `lib/backend/` - Backend integration code
- `lib/auth/` - Authentication logic (Supabase-based)
- `lib/custom_code/` - Custom actions and widgets
- `firebase/functions/` - Cloud functions (Node.js)

### Database Schema
The app uses Supabase with extensive database tables including:
- User management (user_profile, medicos)
- Job postings (vagas, vagas_completo)
- Applications (candidaturas)
- Hospitals and locations
- Payments and benefits
- Notifications and messaging

### Authentication Flow
- Supports multiple auth methods: email, phone, Google, Apple
- Magic link authentication for email
- OTP verification for phone numbers
- Custom auth utilities in `lib/auth/supabase_auth/`

### State Management
- Uses Provider pattern with `FFAppState` for global state
- Local state managed with FlutterFlow's model pattern in each page
- Persistent state stored in SharedPreferences

### Navigation
- Uses GoRouter for navigation
- Route definitions in `lib/flutter_flow/nav/`
- Bottom navigation with tabs: Home, Explorar, Plantões

## Development Guidelines

### Code Style
- Follow Flutter/Dart conventions
- Use FlutterFlow's generated patterns for consistency
- Custom code should integrate with FlutterFlow's architecture
- Avoid modifying generated FlutterFlow files directly

### Custom Code Extensions
- Add custom actions in `lib/custom_code/actions/`
- Add custom widgets in `lib/custom_code/widgets/`
- Update `lib/custom_code/actions/index.dart` when adding new actions

### Database Queries
- Use the generated Supabase table classes in `lib/backend/supabase/database/tables/`
- Follow the established query patterns in the codebase
- Remember to handle null safety properly

### Asset Management
- Images: `assets/images/`
- Fonts: `assets/fonts/` (includes custom icon fonts)
- Animations: `assets/rive_animations/`
- Audio: `assets/audios/`
- JSON data: `assets/jsons/`

## Messaging & Notifications

### Firebase Cloud Messaging (FCM)
- **Centralized Setup**: `initializeFirebaseMessaging` custom action handles all FCM initialization
- **Unified Process**: Combines FCM token management, permissions, and notification setup
- **Platform Support**: iOS (APN) and Android push notifications
- **Token Storage**: Stored in `user_profile` table with platform detection
- **Twilio Integration**: Notification services via `RegisterTwilioBindingCall`

### Notification Architecture
- **iOS Foreground**: Uses `setForegroundNotificationPresentationOptions` for native iOS notifications
- **Background/Terminated**: Standard FCM behavior works automatically
- **Badge Updates**: Custom listener handles badge count updates via `flutter_app_badger`
- **No Local Notifications**: Removed `flutter_local_notifications` dependency for simplicity

### FCM Token Storage
- `user_profile` table stores:
  - `fcm_token` - Firebase Cloud Messaging token
  - `platform` - Platform detection (ios/android/web)  
  - `apn_token` - Apple Push Notification token (iOS only)

### Notification Implementation
- **Main Setup**: Called from `main.dart` via `initializeFirebaseMessaging()`
- **Foreground Handling**: iOS native notifications prevent duplication
- **Badge Management**: Listener filters badge-only messages
- **Simplified Stack**: Reduced complexity by removing local notification layer

## Known Issues & Solutions

### UUID Parameter Issues
- **Problem**: PostgrestException with double-quoted UUIDs in API calls
- **Location**: `lib/pages/login/login_email/login_email_model.dart:107`
- **Solution**: Remove `.toString()` from UUID parameters to avoid double-quoting
- **Example**: Change `userId: (response?.jsonBody ?? '').toString()` to `userId: response?.jsonBody ?? ''`

### Location Permissions
- App handles location permission requests
- Error handling for concurrent permission requests
- Uses geolocator package for location services

### Calendar Permissions
- **iOS Specific**: Use `Permission.calendarWriteOnly` instead of deprecated `Permission.calendar`
- **Permission Flow**: Check status first, then request only if needed
- **iOS Settings Path**: When permanently denied, direct users to "Configurações > Privacidade e Segurança > Calendários"
- **Context Safety**: Always use `context.mounted` checks before showing dialogs after async operations
- **Permission States**: Differentiate between temporary denial vs permanent denial for better UX

## Local Android Run Changes
- Changes needed to run the application locally on Android devices

### Android Gradle Plugin (AGP) Update
- **File**: `android/settings.gradle`
- **Change**: Updated AGP version from 8.1.0 to 8.2.1
- **Reason**: Fixed Flutter build error with Java 21+ compatibility
- **Line 21**: `id "com.android.application" version "8.2.1" apply false`

### Core Library Desugaring
- **File**: `android/app/build.gradle`
- **Changes**: Added desugaring support for legacy notifications (now deprecated)
- **compileOptions section**: Added `coreLibraryDesugaringEnabled true`
- **dependencies section**: Added `coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:2.0.4'`
- **Status**: Can be removed if not using other packages requiring desugaring

## FlutterFlow Deeplinks - Limitações e Soluções

### 🚫 Limitações Identificadas

#### 1. Path Segments Complexos
- **Problema**: URLs como `revoluna://app.com/explorar/bottomsheet?id=xxx` não funcionam
- **Limitação**: FlutterFlow não suporta múltiplos path segments em deeplinks nativamente
- **Erro**: Route parameters como `/explorar/:vagaId` geram erros na UI do FlutterFlow

#### 2. Timing de Page Load
- **Problema**: Depender de `SchedulerBinding.instance.addPostFrameCallback` é inconsistente
- **Limitação**: O timing entre navigation e page load varia
- **Resultado**: Bottom sheets não abrem de forma confiável via page load

#### 3. BuildContext em Custom Actions
- **Problema**: `FFAppState().navigatorKey` não existe
- **Limitação**: Acessar contexto de navegação em custom actions é complexo
- **Necessário**: Usar `appNavigatorKey` do arquivo `nav.dart`

### ✅ Soluções Funcionais

#### 1. Formato de URL Simplificado
```dart
// ✅ FUNCIONA
revoluna://revoluna.com/explorar?id=vaga-id

// ❌ NÃO FUNCIONA  
revoluna://revoluna.com/explorar/bottomsheet?id=vaga-id
```

#### 2. Custom Action Centralizada
- **Estratégia**: Uma única função `handleDeeplink` que gerencia tudo
- **Inclui**: Navigation + Database Query + Bottom Sheet Display
- **Evita**: Dependência de timing de page load

#### 3. Acesso Correto ao NavigatorKey
```dart
// ✅ CORRETO
import '/flutter_flow/nav/nav.dart';
final context = appNavigatorKey.currentContext;

// ❌ ERRADO
final context = FFAppState().navigatorKey?.currentContext;
```

#### 4. Delay Controlado para Navigation
```dart
// ✅ FUNCIONA
GoRouter.of(appNavigatorKey.currentContext!).go('/explorar');
await Future.delayed(Duration(milliseconds: 1500));
await _showVagaBottomSheet(vagaId);
```

#### 5. Verificação Segura de Context
```dart
// ✅ SEGURO
if (context != null && context.mounted) {
  await showModalBottomSheet(...)
}
```

### 📋 Padrão Recomendado para Deeplinks

#### Estrutura da Custom Action
1. **Parse do URL** simples (um path segment + query parameters)
2. **Navigation primeiro** usando `GoRouter.go()`
3. **Delay controlado** (1.5s para garantir navigation)
4. **Query + Bottom sheet** executados na mesma função

#### Formato de URL Recomendado
```
scheme://host/single-path?param=value
```

#### O que Evitar
- Múltiplos path segments em deeplinks
- Dependência de page load para mostrar modals
- Uso de FFAppState para gerenciar deeplinks
- BuildContext complexo em custom actions

#### Implementação Final
- **Arquivo**: `lib/custom_code/actions/initialize_deeplinks.dart`
- **Função**: `handleDeeplink()` com `_showVagaBottomSheet()`
- **Configuração**: iOS (`Info.plist`) e Android (`AndroidManifest.xml`)
- **Formato**: `revoluna://revoluna.com/explorar?id={vaga_id}`

## Recent Optimizations (2025)

### Firebase Messaging Consolidation
- **Removed**: Separate `setFCMToken` and `configNotifications` actions
- **Created**: Single `initializeFirebaseMessaging` action combining all FCM setup
- **Benefits**: Eliminated Firebase initialization duplication, cleaner code structure
- **Location**: `lib/custom_code/actions/initialize_firebase_messaging.dart`

### Notification Stack Simplification
- **Removed**: `flutter_local_notifications` dependency
- **Strategy**: Use native iOS `setForegroundNotificationPresentationOptions` only
- **Result**: Fixed duplicate notifications in foreground, reduced dependencies
- **Badge Handling**: Maintained via `flutter_app_badger` for badge count updates

### Main.dart Initialization Order
```dart
// Current optimized order
await actions.initializeFirebaseMessaging(); // FCM + notifications
await actions.initializeDeeplinks();         // Deep linking
await actions.unreadNotifications();         // Badge count
```

### Custom Actions Inventory
- **Active**: `initializeFirebaseMessaging`, `initializeDeeplinks`, `unreadNotifications`
- **Deprecated**: `setFCMToken`, `configNotifications` (functionality merged)
- **Testing**: `testLocalNotifications` (can be removed if not needed)
```