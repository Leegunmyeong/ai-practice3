# 작업 지침서 (모든 AI 도구 공통)

## 팀 규칙
- Spring Boot 3 / Java 17 REST API 서버. 명세는 `docs/`, 폴더별 규칙은 각 폴더 `README.md` 를 먼저 읽는다.
- 작업 전 `git switch main && git pull origin main` 후 브랜치를 만든다. main 에 직접 커밋하지 않는다.
- 요구사항에 없는 기능·정책을 추가하지 않는다. 불명확·중복·충돌하는 요구사항은 `docs/decisions/<기능명>.md` 에 정리한다.
- 명시적인 요청 없이 기존 명세서와 `src/` 를 수정하지 않는다.
- `.env` 는 읽거나 커밋하지 않는다. PR 머지와 `git push --force` 는 사람만 한다.

## "○○ API 명세 만들어줘" 를 받으면
1. 브랜치 `docs/api-<기능명>` 을 만든다. 기능명은 영문 kebab-case 이고 모든 파일명에 같게 쓴다.
2. `docs/db/README.md` 규칙으로 `docs/db/schema.md` 를 쓴다 (이미 있으면 이어서).
3. `docs/api/README.md` 규칙으로 `docs/api/<기능명>.md` 를 쓴다.
4. `docs/api-tests/README.md` 규칙으로 `docs/api-tests/<기능명>.md` 를 쓴다.
5. 정할 것은 `docs/decisions/README.md` 규칙으로 `docs/decisions/<기능명>.md` 에 모은다.
6. 커밋 `docs: <기능명> API 명세` → push → PR (base main).

## "결정 반영해줘" 를 받으면
- 결정 목록의 `결정` 칸과 PR 코멘트 `D<번호>: …` 중 채워진 것만 명세·DB·예외 테스트에 반영하고 `결정 완료` 로 옮긴다. 비어 있으면 그대로 둔다.
