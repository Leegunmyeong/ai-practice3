# 회원가입

domain: member

url: /api/members

method: POST

success: `201 Created`

# 01. 설명

새 회원을 등록할 때 사용한다.

- 필수: email, password, nickname
- 선택: 없음
- 이메일 검증 규칙 결정 필요 D1, 이메일 중복 처리 결정 필요 D2, 비밀번호 저장 방식 결정 필요 D3, 비밀번호 규칙 결정 필요 D4, 닉네임 규칙 결정 필요 D5, 닉네임 중복 결정 필요 D6, 가입 후 응답 내용 결정 필요 D7

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/members
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| 없음 | | | |

## b. request headers

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| Content-Type | String | Y | `application/json` |

## c. request body

```json
{
  "email": "user@example.com",
  "password": "abcd1234",
  "nickname": "gygim"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| email | String | Y | 이메일. 형식·길이 결정 필요 D1 |
| password | String | Y | 비밀번호. 규칙 결정 필요 D4 |
| nickname | String | Y | 닉네임. 규칙 결정 필요 D5 |

# 03. 응답(Response)

## a. response header

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| Content-Type | String | Y | `application/json` |

## b. response body

**성공 응답:** `201 Created`

```json
{
  "id": 1,
  "email": "user@example.com",
  "nickname": "gygim",
  "createdAt": "2026-11-25T10:00:00"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| id | Long | Y | 생성된 회원 식별자 |
| email | String | Y | 가입한 이메일 |
| nickname | String | Y | 닉네임 |
| createdAt | String | Y | 가입 일시 |

**에러 응답:** `400 Bad Request` — 필수 값이 없거나 형식이 올바르지 않을 때

```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| status | Integer | Y | HTTP 상태 코드 |
| message | String | Y | 에러 메시지 |

**에러 응답:** `409 Conflict` — 이미 가입된 이메일일 때

```json
{
  "status": 409,
  "message": "이미 사용 중인 이메일입니다."
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| status | Integer | Y | HTTP 상태 코드 |
| message | String | Y | 에러 메시지 |
