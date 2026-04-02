#!/usr/bin/env bash

set -euo pipefail

SCRIPT="$HOME/.config/niri/custom/niri-scripts/niri-floating-sidebar.sh"

niri msg event-stream | while read -r line; do
    case "$line" in
        *"Window closed"*)
            # Window was closed → resync sidebar
            "$SCRIPT" reorder >/dev/null 2>&1 || true
            ;;
    esac
done

