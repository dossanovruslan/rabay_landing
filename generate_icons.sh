#!/bin/bash

# Скрипт для генерации всех иконок из исходного логотипа
# Использование: ./generate_icons.sh path/to/app_logo.png

if [ -z "$1" ]; then
    echo "Использование: ./generate_icons.sh path/to/app_logo.png"
    echo "Пожалуйста, укажите путь к исходному изображению логотипа"
    exit 1
fi

SOURCE_IMAGE="$1"

if [ ! -f "$SOURCE_IMAGE" ]; then
    echo "Ошибка: Файл $SOURCE_IMAGE не найден"
    exit 1
fi

echo "Генерация иконок из $SOURCE_IMAGE..."

# Создаем папку для иконок если её нет
mkdir -p web/icons

# Генерируем иконки разных размеров с помощью sips
echo "Создание Icon-192.png..."
sips -z 192 192 "$SOURCE_IMAGE" --out web/icons/Icon-192.png

echo "Создание Icon-512.png..."
sips -z 512 512 "$SOURCE_IMAGE" --out web/icons/Icon-512.png

echo "Создание Icon-maskable-192.png..."
sips -z 192 192 "$SOURCE_IMAGE" --out web/icons/Icon-maskable-192.png

echo "Создание Icon-maskable-512.png..."
sips -z 512 512 "$SOURCE_IMAGE" --out web/icons/Icon-maskable-512.png

# Создаем favicon.png
echo "Создание favicon.png..."
sips -z 32 32 "$SOURCE_IMAGE" --out web/favicon.png

echo "✅ Все иконки успешно созданы!"
echo ""
echo "Созданные файлы:"
ls -lh web/icons/
ls -lh web/favicon.png

echo ""
echo "Теперь выполните: flutter build web --release"
