# 상품 목록 조회 예외 테스트
- 요청: `GET /api/products`

| 번호 | 상황 | 기대 status |
|---|---|---|
| E1 | 잘못된 page 값 | 400 |

## E1. 잘못된 page 값
요청: `GET /api/products?page=-1`

준비: 없음

요청
```json
{}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```
