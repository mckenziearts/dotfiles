# Linux specific aliases
alias load_php8="sudo update-alternatives --set php /usr/bin/php8.4"
alias update="sudo apt update && sudo apt upgrade -y"
alias install="sudo apt install -y"

# Development Environment
alias use-valet="docker-compose down 2>/dev/null; valet start && echo '🚀 Valet mode enabled'"
alias use-docker="valet stop && echo '🐳 Docker mode enabled'"
alias dev-status="echo '=== Valet ===' && valet status; echo '\n=== Docker ===' && (docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' 2>/dev/null || echo '🐳 Docker is not running')"
alias valet-restart="valet restart && echo '✅ Valet restarted'"
