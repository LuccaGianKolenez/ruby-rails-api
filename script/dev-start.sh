#!/usr/bin/env bash
set -euo pipefail
bundle check || bundle install
# usamos "bundle exec rails" (não depende de bin/rails)
bundle exec rails db:create db:migrate db:seed
# sobe o puma abrindo em 0.0.0.0:3000
bundle exec puma -p 3000 -e development
