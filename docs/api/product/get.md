# 상품 단건 조회

domain: product

url: /api/products/{productId}

method: GET

success: `200 OK`

# 01. 설명

상품 하나의 정보를 조회할 때 사용한다.

- 필수: productId
- 선택: 없음
- 공통: 로그인·권한 필요 여부 결정 필요 D15, 400 메시지 구분 결정 필요 D19.

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/products/{productId}
/api/products/1
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| productId | Long | Y | 상품 식별자 |

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
| Content-Type | String | Y | `application/json` |

## b. response body

**성공 응답:** `200 OK`

```json
{
  "id": 1,
  "name": "키보드",
  "price": 35000,
  "description": "기계식 키보드",
  "stock": 10,
  "category": "컴퓨터 주변기기",
  "createdAt": "2026-11-25T10:00:00",
  "updatedAt": "2026-11-25T10:00:00"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| id | Long | Y | 상품 식별자 |
| name | String | Y | 상품명 |
| price | Long | Y | 가격(원) |
| description | String | N | 상품 설명. 없으면 null |
| stock | Integer | Y | 재고 수량 |
| category | String | N | 카테고리. 없으면 null |
| createdAt | String | Y | 등록 일시 |
| updatedAt | String | Y | 수정 일시 |

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
