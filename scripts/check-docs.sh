#!/bin/bash
# 에이전트 문서 규격 검사. 로컬 또는 CI 에서 실행: bash scripts/check-docs.sh
fail=0
err() { echo "❌ $1"; fail=1; }

[ -f AGENTS.md ] || err "AGENTS.md 없음 (팀 규칙 원본)"
lines=$(wc -l < AGENTS.md 2>/dev/null || echo 0)
[ "$lines" -gt 30 ] && err "AGENTS.md ${lines}줄 (상한 30). 늘리기 전에 팀과 상의"
[ "$(wc -l < CLAUDE.md)" -gt 10 ] && err "CLAUDE.md 는 @AGENTS.md + Claude 전용 몇 줄만 (상한 10)"
grep '^@' CLAUDE.md | grep -vq '^@AGENTS.md$' && err "CLAUDE.md 에는 @AGENTS.md 외의 @import 금지 (매 세션 통째로 로드됨)"

for f in .claude/skills/*/SKILL.md .claude/agents/*.md; do
  grep -q '^name:' "$f" || err "$f: name 없음"
  grep -q '^description:' "$f" || err "$f: description 없음"
done

for f in .claude/skills/*/SKILL.md; do
  for ref in $(grep -o '^@[^ ]*' "$f" | tr -d '@'); do
    [ -f "$ref" ] || err "$f: 깨진 참조 $ref"
  done
done

for d in docs/*/; do
  [ -f "${d}README.md" ] || err "${d}README.md 없음 (폴더 규칙 필수)"
done

[ $fail -eq 0 ] && echo "✅ 문서 규격 통과"
exit $fail
