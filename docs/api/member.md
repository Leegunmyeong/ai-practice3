# 회원 단건 조회

domain: member

url: /api/members/{memberId}

method: GET

success: `200 OK`

# 01. 설명

회원 한 명의 정보를 조회할 때 사용한다. 요구사항 문서가 없어 이 API 의 범위는 추천값이며 확정되지 않았다.

- 필수: memberId
- 해당 memberId 의 회원이 없으면 `404 Not Found` 를 반환한다.
- 선택: 없음
- API 범위 결정 필요 D1, 회원가입 명세와의 관계 결정 필요 D2, 조회 권한 결정 필요 D3, 응답 내용 결정 필요 D4, memberId 형식 오류 처리 결정 필요 D6

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/members/{memberId}
/api/members/1
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| memberId | Long | Y | 회원 식별자. 형식 오류 처리 결정 필요 D6 |

## b. request headers

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| 없음 | | | 인증 헤더 결정 필요 D3 |

## c. request body

없음

# 03. 응답(Response)

## a. response header

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| Content-Type | String | Y | `application/json` |

## b. response body

**성공 응답:** `200 OK`

```json
{
  "id": 1,
  "nickname": "gygim",
  "createdAt": "2026-11-25T10:00:00"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| id | Long | Y | 회원 식별자. 응답 내용 결정 필요 D4 |
| nickname | String | Y | 닉네임 |
| createdAt | String | Y | 가입 일시 |

**에러 응답:** `400 Bad Request` — memberId 가 Long 형식이 아닐 때 (결정 필요 D6)

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

**에러 응답:** `404 Not Found` — 해당 memberId 의 회원이 없을 때

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
