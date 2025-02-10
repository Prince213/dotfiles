default: update switch

update:
  nix flake update
  git add flake.lock
  git commit -m "chore(flake): update flake.lock"

push:
  git push

switch:
  nh os switch .
