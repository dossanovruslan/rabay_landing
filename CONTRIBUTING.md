# RaBay Landing - Contributing Guide

## Как внести свой вклад

Спасибо за интерес к проекту! Мы рады любому вкладу.

### Процесс разработки

1. Fork репозитория
2. Создайте ветку для вашей фичи (`git checkout -b feature/amazing-feature`)
3. Commit ваши изменения (`git commit -m 'Add some amazing feature'`)
4. Push в ветку (`git push origin feature/amazing-feature`)
5. Откройте Pull Request

### Стандарты кода

- Следуйте [Effective Dart](https://dart.dev/guides/language/effective-dart)
- Используйте `flutter analyze` перед commit
- Форматируйте код с помощью `dart format .`
- Пишите понятные commit сообщения

### Архитектура

Проект использует чистую архитектуру (Clean Architecture):
- `core/` - общие компоненты
- `features/` - функциональные модули
- Каждый feature разделен на `data`, `domain`, `presentation`
- Используется BLoC для управления состоянием

### Тестирование

```bash
flutter test
```

### Локальный запуск

```bash
flutter pub get
flutter run -d chrome
```
