# 상품 등록

domain: product

url: /api/products

method: POST

success: `201 Created`

# 01. 설명

새 상품을 등록할 때 사용한다.

- 필수: name, price
- 선택: description, stock, category
- 상품명은 1~100자 (D12). description·stock·category 의 세부 규칙 결정 필요 D21, 가격은 0 이상 정수(원) (D13), 상품명 중복 허용 (D14), 응답 내용 결정 필요 D20
- 공통: 로그인·권한 필요 여부 결정 필요 D15, 400 메시지 구분 결정 필요 D19.

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
  "price": 35000,
  "description": "기계식 키보드",
  "stock": 10,
  "category": "컴퓨터 주변기기"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| name | String | Y | 상품명. 1~100자 |
| price | Long | Y | 가격(원). 0 이상 정수 (D13) |
| description | String | N | 상품 설명. 길이 결정 필요 D21 |
| stock | Integer | N | 재고 수량. 생략하면 0. 범위 결정 필요 D21 |
| category | String | N | 카테고리. 길이 결정 필요 D21 |

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
  "description": "기계식 키보드",
  "stock": 10,
  "category": "컴퓨터 주변기기",
  "createdAt": "2026-11-25T10:00:00",
  "updatedAt": "2026-11-25T10:00:00"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| id | Long | Y | 생성된 상품 식별자 |
| name | String | Y | 상품명 |
| price | Long | Y | 가격(원) |
| description | String | N | 상품 설명. 없으면 null |
| stock | Integer | Y | 재고 수량 |
| category | String | N | 카테고리. 없으면 null |
| createdAt | String | Y | 등록 일시 |
| updatedAt | String | Y | 수정 일시 |

**에러 응답:** `400 Bad Request` — 필수 값이 없거나 name 이 1~100자가 아니거나 price 가 0 미만이거나 형식이 올바르지 않을 때

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
