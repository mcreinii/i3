for dir in */; do
  echo "📦 Stowing ${dir%/}"
  stow -vt ~ "${dir%/}"
done
