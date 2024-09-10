# Тестовое задание

## Постановка задачи

Необходимо разработать демонстрационный сервис с простейшим интерфейсом, возвращающий данные о заказе. [Модель данных в формате JSON](https://github.com/IngAivar/demo_service_wb_l0/wiki/JSON-Data) прилагается к заданию.

## Требования

- Заказы должны быть иммутабельны (не меняются после создания, только добавляются). Исходя из этого, подумайте насчет модели хранения в кэше и в PostgreSQL. Модель в файле model.json
- Подумайте как избежать проблем, связанных с тем, что в ручку (http-endpoint) могут закинуть что-угодно
- Для тестирования сделайте себе отдельный скрипт для публикации данных через API
- Подумайте, как не терять данные в случае ошибок или проблем с сервисом

## Конфигурация

Для корректной работы приложения понадобится: установленный `PostgreSQL`, создать БД через консоль `SQL Shell` и поменять пароль от БД в двух файлах.

Работа выполняется на `Windows 11`.

## Локальное развертывание
---
**Шаг 1**: Клонирование репозитория

```bash
https://github.com/IngAivar/demo_service_wb_l0.git
```

---
**Шаг 2**: Настройка приложения под свою машину

Меняем пароли в файлах [`.env`](https://github.com/IngAivar/demo_service_wb_l0/blob/main/images/password_2.png) и [`main.rs`](https://github.com/IngAivar/demo_service_wb_l0/blob/main/images/password_1.png) (пароль от моей БД `12345` его нужно замениь на ваш)

---
**Шаг 3**: Создание БД через `SQL Shell`

Запускаем службу `postgres` если она отключена **картинака службу**.

Открывем консоль `SQL Shell` это можно сделать через поисковик windows клавиша `Win` и написать SQL в поисковой строке.

После открытия консоли требуется, скапировать все содеримое из файла `\migrations\wb_db_l0.sql` в консоль.

Если все будет сделанно правельно, то высветится: **картинка в консоли**

Консоль можно закрыть прописав:

```bash
\q
```

---
**Шаг 4:** Запуск приложения

Запуск окружения осуществляется через комманду:

```bash
$env:RUST_LOG="debug"; cargo run --bin wb_l0_service
```

Тестирование осуществляется через команду POST:

```bash
cargo run --bin test_api
```

Работу приложения можно проверить переийдя по `URL`

```bash
http://127.0.0.1:3000/
```

Результат работы приложения:

```json
[
  {
    "locale": "en",
    "internal_signature": "sweew",
    "customer_id": "cust_001",
    "delivery_service": "DHL",
    "shardkey": "key_001",
    "sm_id": 585,
    "date_created": "2023-09-03T12:00:00Z",
    "oof_shard": "shard_001",
    "order_uid": "testOrder999",
    "track_number": "TRACK123",
    "entry": "web",
    "items": {
      "chrt_id": 123,
      "track_number": "TRACK123",
      "price": 1000,
      "rid": "RID123",
      "name": "Item Name",
      "sale": 10,
      "size": "M",
      "total_price": 900,
      "nm_id": 456,
      "brand": "Brand Name",
      "status": 404
    },
    "payment": {
      "transaction": "TRANS123",
      "request_id": "REQ123",
      "currency": "USD",
      "provider": "VISA",
      "amount": 900,
      "payment_dt": 1633036800,
      "bank": "Bank Name",
      "delivery_cost": 50,
      "goods_total": 950,
      "custom_fee": 0
    },
    "delivery": {
      "name": "John Doe",
      "phone": "+1234567890",
      "zip": "12345",
      "city": "City",
      "address": "123 Main St",
      "region": "Region",
      "email": "email@example.com"
    }
  }
]
```
