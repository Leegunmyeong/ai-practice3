#!/bin/bash
# 처음 세팅이 다 됐는지 한 번에 점검한다: bash scripts/setup-check.sh
ok=0
pass() { echo "✅ $1"; }
fail() { echo "❌ $1"; echo "   → $2"; ok=1; }

command -v claude >/dev/null && pass "Claude Code" || fail "Claude Code 없음" "docs.claude.com 의 Claude Code 설치 안내 (INSTALL.md 1단계)"
command -v gh >/dev/null && pass "GitHub CLI" || fail "GitHub CLI 없음" "Windows: winget install GitHub.cli / Mac: brew install gh → IntelliJ 재시작"
command -v jq >/dev/null && pass "jq" || fail "jq 없음" "Windows: winget install jqlang.jq / Mac: brew install jq → IntelliJ 재시작"
gh auth status >/dev/null 2>&1 && pass "GitHub 로그인" || fail "GitHub 로그인 안 됨" "gh auth login"

if [ -f .env.example ]; then   # H2 만 쓰는 프로젝트(.env.example 없음)는 건너뜀
  if [ -f .env ] && grep -q '^DB_PASSWORD=.\+' .env; then
    pass ".env"
  else
    fail ".env 없음 또는 DB_PASSWORD 비어 있음" ".env.example 을 복사해 .env 로 만들고 비밀번호 입력 (SETUP-DB.md)"
  fi
fi

git ls-files --error-unmatch .env >/dev/null 2>&1 && fail ".env 가 git 에 올라가 있음" "git rm --cached .env 후 커밋"

bash scripts/check-docs.sh >/dev/null 2>&1 && pass "문서 규격" || fail "문서 규격 위반" "bash scripts/check-docs.sh 로 상세 확인"

echo "⏳ 테스트 실행 중 (MySQL 이 켜져 있어야 함)..."
[ -x ./gradlew ] || chmod +x ./gradlew 2>/dev/null
./gradlew test -q >/dev/null 2>&1 && pass "테스트 (DB 연결)" || fail "테스트 실패" "DB 컨테이너 실행(docker start), 테스트 DB 생성, .env 비밀번호 확인 → SETUP-DB.md 문제 해결 표"

echo
[ $ok -eq 0 ] && echo "🎉 준비 완료! claude 를 실행하세요." || echo "위 ❌ 항목을 고친 뒤 다시 실행하세요."
exit $ok
