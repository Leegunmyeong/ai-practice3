# docs 폴더 안내

| 폴더 | 역할 | 관리 방법 |
|---|---|---|
| `api/<도메인>/<동작명>.md` | API 명세: 어떻게 호출하나 | 변경 시 덮어쓴다 |
| `db/` | ERD + 테이블 명세 (`schema.md` 한 파일) | 기능이 늘면 이어서 쓴다 |
| `api-tests/<도메인>/<동작명>.md` | API 별 예외 테스트 (요청 → 응답 JSON) | 명세와 함께 고친다 |
| `decisions/<도메인>.md` | 불명확·충돌하는 요구사항 모음 | 사람이 결정하면 반영한다 |

<!-- [수정: 도메인 구조] 위 표의 api/, api-tests/, decisions/ 칸에 경로 규칙을 추가함 (기존: `api/`, `api-tests/`, `decisions/`) -->
<!-- [수정: 도메인 구조] 아래 예시 트리 새로 추가 -->
```txt
docs/
├── api/
│   └── product/
│       ├── create.md
│       ├── get.md
│       ├── list.md
│       ├── update.md
│       └── delete.md
├── api-tests/
│   └── product/        (api/ 와 같은 파일 구조)
├── decisions/
│   └── product.md
└── db/
    └── schema.md
```

각 폴더의 `README.md` 에 작성 지침과 템플릿이 있다.
