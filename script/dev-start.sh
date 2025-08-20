set -euo pipefail
bundle check || bundle install
bundle exec rails db:create db:migrate db:seed
bundle exec puma -p 3000 -e development
