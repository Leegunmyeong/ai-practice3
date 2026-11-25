# 상품 API

상품 요구사항 문서가 없어 기본 CRUD 5개를 추천값으로 정리했다 (범위 결정 필요 D10). 엔드포인트는 아래 순서로 이어서 적는다.

| 번호 | 이름 | method | url | success |
|---|---|---|---|---|
| 1 | 상품 등록 | POST | /api/products | `201 Created` |
| 2 | 상품 단건 조회 | GET | /api/products/{productId} | `200 OK` |
| 3 | 상품 목록 조회 | GET | /api/products | `200 OK` |
| 4 | 상품 수정 | PATCH | /api/products/{productId} | `200 OK` |
| 5 | 상품 삭제 | DELETE | /api/products/{productId} | `204 No Content` |

공통: 로그인·권한 필요 여부 결정 필요 D15, 400 메시지 구분 결정 필요 D19.

---

# 1. 상품 등록

domain: product

url: /api/products

method: POST

success: `201 Created`

# 01. 설명

새 상품을 등록할 때 사용한다.

- 필수: name, price
- 선택: 없음
- 필드 구성 결정 필요 D11, 상품명 규칙 결정 필요 D12, 가격 규칙 결정 필요 D13, 상품명 중복 결정 필요 D14, 응답 내용 결정 필요 D20

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/products
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
  "name": "키보드",
  "price": 35000
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| name | String | Y | 상품명. 길이 결정 필요 D12 |
| price | Long | Y | 가격(원). 범위 결정 필요 D13 |

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
  "name": "키보드",
  "price": 35000,
  "createdAt": "2026-11-25T10:00:00",
  "updatedAt": "2026-11-25T10:00:00"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| id | Long | Y | 생성된 상품 식별자 |
| name | String | Y | 상품명 |
| price | Long | Y | 가격(원) |
| createdAt | String | Y | 등록 일시 |
| updatedAt | String | Y | 수정 일시 |

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

---

# 2. 상품 단건 조회

domain: product

url: /api/products/{productId}

method: GET

success: `200 OK`

# 01. 설명

상품 하나의 정보를 조회할 때 사용한다.

- 필수: productId
- 선택: 없음

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
  "createdAt": "2026-11-25T10:00:00",
  "updatedAt": "2026-11-25T10:00:00"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| id | Long | Y | 상품 식별자 |
| name | String | Y | 상품명 |
| price | Long | Y | 가격(원) |
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

---

# 3. 상품 목록 조회

domain: product

url: /api/products

method: GET

success: `200 OK`

# 01. 설명

상품 목록을 페이지 단위로 조회할 때 사용한다.

- 필수: 없음
- 선택: page, size, sort
- 기본값과 응답 형태 결정 필요 D18

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/products?page={page}&size={size}&sort={sort}
/api/products?page=0&size=20&sort=createdAt,desc
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| page | Integer | N | 페이지 번호(0부터). 기본값 0. 결정 필요 D18 |
| size | Integer | N | 페이지 크기. 기본값 20. 결정 필요 D18 |
| sort | String | N | `<필드>,<asc\|desc>`. 기본값 `createdAt,desc`. 정렬 가능 필드는 id, name, price, createdAt. 결정 필요 D18 |

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
  "content": [
    {
      "id": 1,
      "name": "키보드",
      "price": 35000,
      "createdAt": "2026-11-25T10:00:00",
      "updatedAt": "2026-11-25T10:00:00"
    }
  ],
  "page": 0,
  "size": 20,
  "totalElements": 1,
  "totalPages": 1
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| content | Array | Y | 상품 목록. 없으면 빈 배열 |
| content[].id | Long | Y | 상품 식별자 |
| content[].name | String | Y | 상품명 |
| content[].price | Long | Y | 가격(원) |
| content[].createdAt | String | Y | 등록 일시 |
| content[].updatedAt | String | Y | 수정 일시 |
| page | Integer | Y | 현재 페이지 번호 |
| size | Integer | Y | 페이지 크기 |
| totalElements | Long | Y | 전체 상품 수 |
| totalPages | Integer | Y | 전체 페이지 수 |

**에러 응답:** `400 Bad Request` — page, size, sort 값이 올바르지 않을 때

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

---

# 4. 상품 수정

domain: product

url: /api/products/{productId}

method: PATCH

success: `200 OK`

# 01. 설명

등록된 상품의 정보를 수정할 때 사용한다.

- 필수: productId, body 의 name·price 중 1개 이상
- 선택: name, price (보낸 필드만 변경)
- 수정 방식 결정 필요 D17, 상품명 규칙 결정 필요 D12, 가격 규칙 결정 필요 D13, 상품명 중복 결정 필요 D14, 응답 내용 결정 필요 D20

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/products/{productId}
/api/products/1
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| productId | Long | Y | 수정할 상품 식별자 |

## b. request headers

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| Content-Type | String | Y | `application/json` |

## c. request body

```json
{
  "price": 39000
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| name | String | N | 변경할 상품명. 규칙 결정 필요 D12 |
| price | Long | N | 변경할 가격(원). 규칙 결정 필요 D13 |

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
  "price": 39000,
  "createdAt": "2026-11-25T10:00:00",
  "updatedAt": "2026-11-25T11:00:00"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| id | Long | Y | 수정된 상품 식별자 |
| name | String | Y | 상품명 |
| price | Long | Y | 가격(원) |
| createdAt | String | Y | 등록 일시 |
| updatedAt | String | Y | 수정 일시 |

**에러 응답:** `400 Bad Request` — 수정할 값이 하나도 없거나 형식이 올바르지 않을 때

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

---

# 5. 상품 삭제

domain: product

url: /api/products/{productId}

method: DELETE

success: `204 No Content`

# 01. 설명

등록된 상품을 삭제할 때 사용한다.

- 필수: productId
- 선택: 없음
- 삭제 방식 결정 필요 D16

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
