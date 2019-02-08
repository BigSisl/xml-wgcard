#!/usr/bin/env bash
d="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"

php -S localhost:8000 "$d"/public
