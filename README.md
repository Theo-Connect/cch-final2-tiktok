# TikTok Final

Flutter 기반 소셜 미디어 앱 프로젝트

## 프로젝트 개요

이 프로젝트는 TikTok과 유사한 소셜 미디어 앱을 Flutter로 구현하는 것을 목표로 합니다.

## 현재 구현 상태

### ✅ 완료된 기능

#### 1. 프로젝트 기본 설정
- Flutter 프로젝트 초기화
- Firebase 연동 설정
- 상태 관리 (Riverpod) 설정
- 라우팅 (GoRouter) 설정

#### 2. 인증 시스템
- Firebase Authentication 연동
- 이메일/비밀번호 로그인
- 회원가입 기능
- 로그아웃 기능
- 인증 상태 관리

#### 3. 데이터 모델
- **UserModel**: 사용자 정보 (uid, email, displayName, profileImageUrl, createdAt)
- **PostModel**: 게시물 정보 (id, userId, content, imageUrl, likes, createdAt)

#### 4. 화면 구조
- **HomeScreen**: 메인 화면
- **LoginScreen**: 로그인 화면
- **ProfileScreen**: 프로필 화면

#### 5. 서비스 레이어
- **AuthService**: Firebase 인증 서비스
- **FirestoreService**: Firestore 데이터베이스 서비스
- **StorageService**: Firebase Storage 서비스

### 🔧 기술 스택

- **Frontend**: Flutter (Dart)
- **상태 관리**: Riverpod
- **라우팅**: GoRouter
- **백엔드**: Firebase
  - Authentication (인증)
  - Firestore (데이터베이스)
  - Storage (파일 저장)

### 📦 주요 의존성

```yaml
dependencies:
  flutter_riverpod: ^2.5.1    # 상태 관리
  go_router: ^14.2.7          # 라우팅
  firebase_core: ^3.6.0       # Firebase 코어
  firebase_auth: ^5.3.1       # Firebase 인증
  cloud_firestore: ^5.4.3     # Firestore 데이터베이스
  firebase_storage: ^12.3.2   # Firebase 스토리지
```

### 📁 프로젝트 구조

```
lib/
├── models/              # 데이터 모델
│   ├── user_model.dart
│   └── post_model.dart
├── providers/           # Riverpod 프로바이더
│   ├── auth_provider.dart
│   ├── firestore_provider.dart
│   └── storage_provider.dart
├── router/              # 라우팅 설정
│   └── app_router.dart
├── screens/             # 화면 위젯
│   ├── home_screen.dart
│   ├── login_screen.dart
│   └── profile_screen.dart
├── services/            # 비즈니스 로직
│   ├── auth_service.dart
│   ├── firestore_service.dart
│   └── storage_service.dart
├── widgets/             # 재사용 가능한 위젯
├── firebase_options.dart
└── main.dart
```

### 🚀 실행 방법

1. **의존성 설치**
   ```bash
   flutter pub get
   ```

2. **Firebase 설정**
   - Firebase 프로젝트 생성
   - Android/iOS 앱 등록
   - `google-services.json` (Android) 및 `GoogleService-Info.plist` (iOS) 파일 추가

3. **앱 실행**
   ```bash
   flutter run
   ```

### 📋 다음 구현 예정 기능

- [ ] 게시물 작성/수정/삭제
- [ ] 이미지/동영상 업로드
- [ ] 피드 화면
- [ ] 좋아요 기능
- [ ] 댓글 시스템
- [ ] 사용자 프로필 편집
- [ ] 팔로우/팔로워 기능
- [ ] 검색 기능
- [ ] 푸시 알림

### 🔧 개발 환경

- Flutter SDK: ^3.8.1
- Dart: ^3.8.1
- Firebase: 최신 버전

### 📝 참고 자료

- [Flutter 공식 문서](https://docs.flutter.dev/)
- [Firebase 공식 문서](https://firebase.google.com/docs)
- [Riverpod 공식 문서](https://riverpod.dev/)
- [GoRouter 공식 문서](https://pub.dev/packages/go_router)
