# Deployment Guide для RaBay Landing

## 🚀 Быстрый старт

### 1. Подготовка репозитория

Убедитесь, что все файлы закоммичены:

```bash
git add .
git commit -m "Setup landing page"
git push origin main
```

### 2. Настройка GitHub Pages

1. Перейдите в ваш репозиторий на GitHub
2. Откройте **Settings** → **Pages**
3. В разделе **Source** выберите **GitHub Actions**
4. Сохраните изменения

### 3. Настройка base-href

Откройте файл `.github/workflows/deploy.yml` и измените строку:

```yaml
flutter build web --release --base-href "/rabay_landing/"
```

Замените `/rabay_landing/` на **имя вашего репозитория**. Например:
- Если репозиторий называется `my-app`, используйте `/my-app/`
- Если это главный сайт (username.github.io), используйте `/`

### 4. Запуск деплоя

После push в ветку `main` или `master` автоматически запустится деплой.

Следить за процессом можно во вкладке **Actions** на GitHub.

### 5. Проверка результата

После успешного деплоя сайт будет доступен по адресу:

```
https://username.github.io/repository-name/
```

## 🔧 Возможные проблемы

### Деплой не запускается

**Решение:**
- Убедитесь, что в Settings → Pages выбран "GitHub Actions"
- Проверьте, что у репозитория есть права на Actions

### Ошибка при сборке

**Решение:**
```bash
# Проверьте локально
flutter pub get
flutter analyze
flutter build web --release

# Если локально работает, но на GitHub нет - проверьте:
# 1. Все зависимости добавлены в pubspec.yaml
# 2. Нет ошибок в коде
# 3. Все assets правильно подключены
```

### Неправильные пути к файлам

**Проблема:** Стили и изображения не загружаются

**Решение:** Проверьте `base-href` в `.github/workflows/deploy.yml`

### Старая версия после деплоя

**Решение:**
```bash
# Очистите кэш браузера или откройте в режиме инкогнито
# Проверьте, что новый commit запустил деплой
```

## 📝 Локальное тестирование

### Запуск в режиме разработки

```bash
flutter run -d chrome
```

### Сборка production версии

```bash
flutter build web --release
```

### Тестирование production сборки локально

```bash
# Установите локальный сервер
python3 -m http.server 8000 --directory build/web

# Или используйте flutter_web_server
flutter pub global activate dhttpd
dhttpd --path=build/web
```

Затем откройте http://localhost:8000

## 🎯 Чеклист перед деплоем

- [ ] Обновлены все ссылки в `app_constants.dart`
- [ ] Правильно настроен `base-href`
- [ ] Локальная сборка работает (`flutter build web --release`)
- [ ] Настроен GitHub Pages (Source: GitHub Actions)
- [ ] Проверен анализ кода (`flutter analyze`)
- [ ] Все assets добавлены в `pubspec.yaml`

## 🔄 Обновление сайта

Для обновления сайта:

```bash
# 1. Внесите изменения в код
# 2. Проверьте локально
flutter run -d chrome

# 3. Закоммитьте и запушьте
git add .
git commit -m "Update landing page"
git push origin main

# 4. Деплой запустится автоматически
```

## 📊 Мониторинг деплоя

1. Перейдите во вкладку **Actions** на GitHub
2. Выберите последний workflow run
3. Следите за выполнением этапов:
   - ✅ Checkout
   - ✅ Setup Flutter
   - ✅ Get dependencies
   - ✅ Build web
   - ✅ Upload artifact
   - ✅ Deploy

При ошибках смотрите логи конкретного шага.

## 🌐 Кастомный домен (опционально)

Если хотите использовать свой домен:

1. Создайте файл `web/CNAME` с вашим доменом:
   ```
   yourdomain.com
   ```

2. В настройках DNS добавьте записи:
   ```
   A    @    185.199.108.153
   A    @    185.199.109.153
   A    @    185.199.110.153
   A    @    185.199.111.153
   ```

3. В GitHub Settings → Pages укажите кастомный домен

## 🔎 SEO и верификация в поисковиках

Проект уже содержит `web/sitemap.xml` и `web/robots.txt`, а в workflow деплоя включен post-build шаг, который:

- актуализирует `sitemap.xml` (дата `lastmod`);
- обновляет `robots.txt` с правильным Sitemap URL;
- при наличии токенов добавляет верификацию Google и Bing.

### Что нужно добавить в GitHub Secrets

Откройте **Settings → Secrets and variables → Actions** и добавьте:

- `GSC_VERIFICATION_TOKEN` — токен из Google Search Console;
- `BING_VERIFICATION_TOKEN` — токен из Bing Webmaster Tools.

После следующего деплоя workflow автоматически:

- добавит meta-теги в `index.html`;
- создаст `google<token>.html`;
- создаст `BingSiteAuth.xml`.

### Отправка sitemap в панели вебмастеров

После деплоя отправьте карту сайта в обе панели:

- `https://rabay.kz/sitemap.xml`

## 📱 Проверка на разных устройствах

После деплоя проверьте на:
- 📱 Мобильных устройствах (iOS/Android)
- 💻 Desktop браузерах (Chrome, Firefox, Safari)
- 🖥️ Планшетах

Используйте DevTools для эмуляции разных размеров экрана.

---

**Нужна помощь?** Создайте Issue в репозитории.
