#!/usr/bin/env bash
d="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"

cd "$d/public"
php -S localhost:8000
