# 장바구니 항목 삭제 예외 테스트
- 요청: `DELETE /api/carts/{memberId}/items/{cartItemId}`

| 번호 | 상황 | 기대 status |
|---|---|---|
| E1 | cartItemId 가 숫자가 아님 | 400 |
| E2 | 없는 회원 | 404 |
| E3 | 없는 항목 (다른 회원의 항목 포함) | 404 |

## E1. cartItemId 가 숫자가 아님
요청: `DELETE /api/carts/1/items/abc`

준비: 회원 1 이 있음

요청
```json
없음
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E2. 없는 회원
요청: `DELETE /api/carts/999/items/1`

준비: 회원 999 가 없음

요청
```json
없음
```

응답 `404`
```json
{
  "status": 404,
  "message": "회원을 찾을 수 없습니다."
}
```

## E3. 없는 항목 (다른 회원의 항목 포함)
요청: `DELETE /api/carts/1/items/999`

준비: 회원 1 이 있음, 항목 999 가 회원 1 의 장바구니에 없음

요청
```json
없음
```

응답 `404`
```json
{
  "status": 404,
  "message": "장바구니 항목을 찾을 수 없습니다."
}
```
