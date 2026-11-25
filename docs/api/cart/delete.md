# 장바구니 항목 삭제

domain: cart

url: /api/carts/{memberId}/items/{cartItemId}

method: DELETE

success: `204 No Content`

# 01. 설명

장바구니에 담긴 항목 하나를 뺄 때 사용한다. 결정 번호는 `docs/decisions/cart.md` 기준이다.

- 필수: memberId, cartItemId
- 선택: 없음
- 장바구니 API 범위 결정 필요 D1, 장바구니 소유자 식별 방식 결정 필요 D2, 다른 회원의 항목 접근 처리 결정 필요 D9
- 항목은 물리 삭제한다 (상품 삭제 방식 product D16 과 같음, 새로 정하지 않음).
- 회원이 없으면 `404 Not Found`, 해당 회원의 장바구니에 항목이 없으면 `404 Not Found` 를 반환한다.
- 공통: 로그인·권한 필요 여부는 member D3, product D15 와 같다 (새로 정하지 않음). 400 메시지 구분은 product D19, member D6 과 같다 (새로 정하지 않음).

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/carts/{memberId}/items/{cartItemId}
/api/carts/1/items/1
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| memberId | Long | Y | 장바구니 소유 회원 식별자. 소유자 식별 방식 결정 필요 D2 |
| cartItemId | Long | Y | 삭제할 장바구니 항목 식별자 |

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

**에러 응답:** `400 Bad Request` — memberId 또는 cartItemId 가 Long 형식이 아닐 때

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

**에러 응답:** `404 Not Found` — 해당 회원의 장바구니에 항목이 없을 때 (다른 회원의 항목 포함, 결정 필요 D9)

```json
{
  "status": 404,
  "message": "장바구니 항목을 찾을 수 없습니다."
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| status | Integer | Y | HTTP 상태 코드 |
| message | String | Y | 에러 메시지 |
