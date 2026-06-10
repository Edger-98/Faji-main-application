#!/usr/bin/env bash
set -euo pipefail

BOLD='\033[1m'; CYAN='\033[0;36m'; GREEN='\033[0;32m'
YELLOW='\033[0;33m'; RED='\033[0;31m'; RESET='\033[0m'

echo -e "${BOLD}${CYAN}── Flutter Emulator Launcher ──${RESET}\n"

raw=$(flutter emulators 2>/dev/null) || { echo -e "${RED}flutter not found in PATH${RESET}"; exit 1; }

# Build ID and name arrays without mapfile (bash 3 compatible)
IDS=(); NAMES=()
while IFS= read -r line; do
  if echo "$line" | grep -qE '^[A-Za-z].*•'; then
    id=$(echo "$line" | awk '{print $1}')
    name=$(echo "$line" | sed 's/^[^ ]*[ ]*•[ ]*//' | sed 's/[ ]*•.*//')
    IDS+=("$id")
    NAMES+=("$name")
  fi
done <<< "$raw"

if [[ ${#IDS[@]} -eq 0 ]]; then
  echo -e "${YELLOW}No emulators found. Create one with:${RESET}"
  echo "  flutter emulators --create --name MyDevice"
  exit 1
fi

# Direct launch if argument provided
if [[ $# -ge 1 ]]; then
  target="$1"
  matched=""
  for id in "${IDS[@]}"; do
    [[ "$id" == "$target" ]] && { matched="$id"; break; }
  done
  if [[ -z "$matched" ]]; then
    for id in "${IDS[@]}"; do
      [[ "$id" == *"$target"* ]] && { matched="$id"; break; }
    done
  fi
  if [[ -z "$matched" ]]; then
    echo -e "${RED}No emulator matching '$target'${RESET}"; exit 1
  fi
  echo -e "${GREEN}Launching ${BOLD}$matched${RESET}${GREEN}...${RESET}"
  flutter emulators --launch "$matched"
  exit 0
fi

# Interactive picker
echo -e "Available emulators:\n"
for i in "${!IDS[@]}"; do
  printf "  ${BOLD}%2d${RESET}  ${CYAN}%-35s${RESET} %s\n" \
    "$((i+1))" "${IDS[$i]}" "${NAMES[$i]}"
done

echo ""
printf "${BOLD}Pick a number (or q to quit): ${RESET}"
read -r choice

[[ "$choice" == "q" || "$choice" == "Q" ]] && exit 0

if ! echo "$choice" | grep -qE '^[0-9]+$' || \
   (( choice < 1 || choice > ${#IDS[@]} )); then
  echo -e "${RED}Invalid choice${RESET}"; exit 1
fi

selected="${IDS[$((choice-1))]}"
echo -e "\n${GREEN}Launching ${BOLD}$selected${RESET}${GREEN}...${RESET}"
flutter emulators --launch "$selected"
echo -e "${GREEN}Done.${RESET}"
