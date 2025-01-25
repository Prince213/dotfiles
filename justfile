default: update

update:
  nix flake update
  git add flake.lock
  git commit -m "chore(flake): update flake.lock"

push:
  git push
