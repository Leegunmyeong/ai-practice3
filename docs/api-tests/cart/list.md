# 장바구니 조회 예외 테스트
- 요청: `GET /api/carts/{memberId}/items`

| 번호 | 상황 | 기대 status |
|---|---|---|
| E1 | memberId 가 숫자가 아님 | 400 |
| E2 | 없는 회원 | 404 |

## E1. memberId 가 숫자가 아님
요청: `GET /api/carts/abc/items`

준비: 없음

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
요청: `GET /api/carts/999/items`

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
