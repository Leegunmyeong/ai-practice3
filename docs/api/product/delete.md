# 상품 삭제

domain: product

url: /api/products/{productId}

method: DELETE

success: `204 No Content`

# 01. 설명

등록된 상품을 삭제할 때 사용한다.

- 필수: productId
- 선택: 없음
- 삭제 방식 결정 필요 D16
- 공통: 로그인·권한 필요 여부 결정 필요 D15, 400 메시지 구분 결정 필요 D19.

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/products/{productId}
/api/products/1
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| productId | Long | Y | 삭제할 상품 식별자 |

## b. request headers

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| 없음 | | | |

## c. request body

없음

# 03. 응답(Response)

## a. response header

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| 없음 | | | |

## b. response body

**성공 응답:** `204 No Content`

없음 (응답 body 없음)

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| 없음 | | | |

**에러 응답:** `404 Not Found` — 상품이 없을 때

```json
{
  "status": 404,
  "message": "상품을 찾을 수 없습니다."
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| status | Integer | Y | HTTP 상태 코드 |
| message | String | Y | 에러 메시지 |
