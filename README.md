# 🔥 tg-proxy.killajeden

![Version](https://img.shields.io/badge/version-1.0-brightgreen)
![Platform](https://img.shields.io/badge/platform-Windows-blue)
![License](https://img.shields.io/badge/license-MIT-orange)

**Telegram MTProto WebSocket Proxy** — обход блокировок Telegram в России через Cloudflare.

---

## 📌 Описание

**Killjaeden Proxy** — это локальный прокси-сервер, который позволяет обходить блокировку Telegram в России.

Принцип работы:
- Преобразует MTProto-трафик Telegram в WebSocket (WSS) через Cloudflare.
- Использует динамически подгружаемые Cloudflare-домены для обхода DPI.
- Не требует VPN, дополнительных настроек или платных сервисов.

---

## 📥 Установка

### Способ 1: Скачать готовый бинарник (рекомендуется)

1. Перейди в раздел **[Releases](https://github.com/tklljaeden/tg-proxy.killajeden/releases)**.
2. Скачай архив с последней версией.
3. Распакуй в любую папку.
4. Запусти `KilljaedenProxy.bat`.

### Способ 2: Собрать из исходников (для разработчиков)

```bash
git clone https://github.com/tklljaeden/tg-proxy.killajeden.git
cd tg-proxy.killajeden
cargo build --release

🚀 Использование
Запусти KilljaedenProxy.bat.

Подожди 5 секунд — ссылка автоматически скопируется в буфер обмена.

Открой Telegram (десктоп или телефон).

Вставь ссылку (Ctrl+V) — Telegram сам предложит подключиться к прокси.

Нажми «Подключиться».

Готово! Telegram работает без блокировок.

⚠️ Важно: Окно с прокси должно быть открыто, пока ты пользуешься Telegram.
