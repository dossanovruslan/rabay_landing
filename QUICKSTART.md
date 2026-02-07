# Quick Start Guide - RaBay Landing

## 🎯 За 5 минут до деплоя

### Шаг 1: Склонируйте репозиторий (если еще не сделали)

```bash
git clone https://github.com/your-username/rabay_landing.git
cd rabay_landing
```

### Шаг 2: Установите зависимости

```bash
flutter pub get
```

### Шаг 3: Обновите ссылки

Откройте `lib/core/constants/app_constants.dart` и замените:

```dart
// Store Links
static const String appStoreUrl = 'ваша_ссылка_на_app_store';
static const String googlePlayUrl = 'ваша_ссылка_на_google_play';

// Social Links
static const String instagramUrl = 'ваш_instagram';
static const String facebookUrl = 'ваш_facebook';
static const String telegramUrl = 'ваш_telegram';

// Legal Links
static const String privacyPolicyUrl = 'ссылка_на_политику';
static const String termsOfServiceUrl = 'ссылка_на_условия';
```

### Шаг 4: Проверьте локально

```bash
flutter run -d chrome
```

Откройте http://localhost:xxxxx и проверьте, что все выглядит правильно.

### Шаг 5: Обновите base-href

Откройте `.github/workflows/deploy.yml` и замените:

```yaml
flutter build web --release --base-href "/rabay_landing/"
```

на имя **вашего репозитория**:

```yaml
flutter build web --release --base-href "/your-repo-name/"
```

### Шаг 6: Настройте GitHub Pages

1. Запушьте код на GitHub:
   ```bash
   git add .
   git commit -m "Setup landing page"
   git push origin main
   ```

2. На GitHub откройте репозиторий
3. `Settings` → `Pages`
4. В **Source** выберите `GitHub Actions`

### Шаг 7: Дождитесь деплоя

1. Перейдите во вкладку `Actions`
2. Дождитесь завершения "Deploy Flutter Web to GitHub Pages"
3. При успехе индикатор будет зеленым ✅

### Шаг 8: Откройте сайт

Ваш лендинг доступен по адресу:
```
https://your-username.github.io/your-repo-name/
```

---

## ✅ Готово!

Теперь при каждом push в `main` ветку сайт будет автоматически обновляться.

## 🔧 Если что-то пошло не так

Смотрите детальную инструкцию в [DEPLOYMENT.md](DEPLOYMENT.md)
