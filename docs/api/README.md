# API 명세 작성 지침서

## 언제 수정하나
- API 가 바뀌면 코드보다 명세를 먼저 고친다.
- API 하나당 파일 하나: `docs/api/<기능명>.md` (예: `docs/api/signup.md`, `docs/api/update-member.md`)
- 같은 API의 명세가 이미 있으면 새로 만들지 않고 덮어쓴다.

## 작업 순서
0. 맨 위 `success:` 에 성공 상태 코드를 적는다 (생성 201, 조회·수정 200, 삭제 204).
1. `docs/api/` 에 같은 API의 명세가 이미 있는지 확인한다.
2. 요청에서 기능명과 필요한 API를 정리한다.
3. 아래 작성 규칙과 템플릿대로 명세를 작성한다.
4. 다 쓴 뒤 작성 규칙을 하나씩 대조해 빠진 것이 없는지 확인한다.

## 작성 규칙 (팀 API 설계 규칙)
- 아래 템플릿의 항목, 순서, 표 형식(이름 | 데이터타입 | 필수 | 설명)을 그대로 따른다. 내용이 없는 섹션도 지우지 않고 `없음` 이라고 적는다.
- URL: 영문 소문자, 명사·복수형, 리소스 중심 (`/api/members`). 동작은 HTTP Method 로 구분한다 (GET, POST, PATCH, DELETE).
- Path Variable: `{memberId}` 처럼 리소스별 식별자 이름을 통일한다.
- Query Parameter: 검색·정렬·페이징은 `page`, `size`, `sort` 로 통일한다.
- 필드: camelCase (`memberName`).
- 상태 코드: API 마다 성공·실패 상태 코드를 적는다 (200, 201, 400, 404 …).
- 요청·응답 JSON 예시를 반드시 넣는다.
- 예외 응답은 `{ "status": <숫자>, "message": "..." }` 로 통일하고, 상황별로 하나씩 적는다.
- 요구사항에 없는 정책(검증 규칙, 권한 등)은 추측하지 않고 설명 칸에 `결정 필요 D<번호>` 라고 적은 뒤 `docs/decisions/<기능명>.md` 에 모은다.

## 템플릿

````markdown
# <API 이름>

domain: <도메인>

url: /api/<리소스>/{<식별자>}

method: <GET | POST | PATCH | PUT | DELETE>

success: <성공 상태 코드> (예: `201 Created`, `200 OK`, `204 No Content`)

# 01. 설명

<이 API를 언제 쓰는지 한두 문장>

- <필수 사항>
- <선택 사항>

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/members/{memberId}
/api/members/1
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| memberId | Long | Y | 회원 식별자 |

## b. request headers

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| 없음 | | | |

## c. request body

```json
{
  "name": "gygim"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| name | String | Y | 변경할 회원 이름 |

# 03. 응답(Response)

## a. response header

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| 없음 | | | |

## b. response body

**성공 응답:** `200 OK`

```json
{
  "id": 1,
  "updatedAt": "2026-11-17T10:00:00"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| id | Long | Y | 수정된 회원 식별자 |
| updatedAt | String | Y | 수정 일시 |

**에러 응답:** `404 Not Found` — 회원이 없을 때

```json
{
  "status": 404,
  "message": "회원을 찾을 수 없습니다."
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| status | Integer | Y | HTTP 상태 코드 |
| message | String | Y | 에러 메시지 |
````
