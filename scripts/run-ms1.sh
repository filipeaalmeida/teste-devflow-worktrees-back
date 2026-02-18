#!/usr/bin/env bash
PORT="${1:?Usage: run-ms1.sh <port>}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"
source env/bin/activate

nohup uvicorn ms1.app:app --host 0.0.0.0 --port "$PORT" > server-ms1.log 2>&1 &
disown
