#!/bin/bash
# main 브랜치에서 파일 수정과 commit/push 를 막는다 → 에이전트가 브랜치를 먼저 만들게 한다
INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name')
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // ""')
BRANCH=$(git -C "$CLAUDE_PROJECT_DIR" branch --show-current)

[[ "$BRANCH" != "main" ]] && exit 0

MSG="현재 main 브랜치입니다. 먼저 'git switch -c <type>/<요약>' 으로 작업 브랜치를 만든 뒤 다시 시도하세요. (type: docs, feat, fix, refactor, test, chore)"

if [[ "$TOOL" == "Write" || "$TOOL" == "Edit" ]]; then
  echo "$MSG" >&2
  exit 2
fi

if [[ "$CMD" =~ git[[:space:]]+(commit|push) ]]; then
  echo "$MSG" >&2
  exit 2
fi
exit 0
