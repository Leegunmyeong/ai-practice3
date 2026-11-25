# 장바구니 담기

domain: cart

url: /api/carts/{memberId}/items

method: POST

success: `201 Created`

# 01. 설명

회원이 상품을 장바구니에 담을 때 사용한다. 요구사항 문서가 없어 이 API 의 범위는 추천값이며 확정되지 않았다. 결정 번호는 `docs/decisions/cart.md` 기준이다.

- 필수: memberId, productId, quantity
- 선택: 없음
- 장바구니 API 범위 결정 필요 D1, 장바구니 소유자 식별 방식 결정 필요 D2, 같은 상품을 다시 담을 때 처리 결정 필요 D3, 수량 범위 결정 필요 D4, 재고 검증 결정 필요 D5, 응답 내용 결정 필요 D7
- 회원이 없으면 `404 Not Found`, 상품이 없으면 `404 Not Found` 를 반환한다. 회원 없음 메시지는 member D5 (`docs/decisions/member.md`) 를 따른다.
- 공통: 로그인·권한 필요 여부는 member D3, product D15 와 같다 (새로 정하지 않음). 400 메시지 구분은 product D19, member D6 과 같다 (새로 정하지 않음).

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/carts/{memberId}/items
/api/carts/1/items
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| memberId | Long | Y | 장바구니 소유 회원 식별자. 소유자 식별 방식 결정 필요 D2 |

## b. request headers

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| Content-Type | String | Y | `application/json` |

## c. request body

```json
{
  "productId": 1,
  "quantity": 2
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| productId | Long | Y | 담을 상품 식별자 |
| quantity | Integer | Y | 담을 수량. 1 이상 정수. 범위 결정 필요 D4, 재고 검증 결정 필요 D5 |

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
  "productId": 1,
  "productName": "키보드",
  "price": 35000,
  "quantity": 2,
  "createdAt": "2026-11-25T10:00:00",
  "updatedAt": "2026-11-25T10:00:00"
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| id | Long | Y | 장바구니 항목 식별자. 같은 상품을 다시 담으면 기존 항목 (결정 필요 D3) |
| productId | Long | Y | 상품 식별자 |
| productName | String | Y | 상품명. 응답 내용 결정 필요 D7 |
| price | Long | Y | 상품의 현재 가격(원). 응답 내용 결정 필요 D7 |
| quantity | Integer | Y | 담긴 수량. 같은 상품을 다시 담으면 합산된 수량 (결정 필요 D3) |
| createdAt | String | Y | 항목이 처음 담긴 일시 |
| updatedAt | String | Y | 항목 수정 일시 |

**에러 응답:** `400 Bad Request` — memberId 가 Long 형식이 아니거나 필수 값이 없거나 quantity 가 1 미만이거나 형식이 올바르지 않을 때

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
