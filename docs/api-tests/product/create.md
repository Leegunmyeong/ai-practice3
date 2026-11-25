# 상품 등록 예외 테스트
- 요청: `POST /api/products`

| 번호 | 상황 | 기대 status |
|---|---|---|
| E1 | 필수 값(name) 누락 | 400 |
| E2 | name 이 100자 초과 | 400 |
| E3 | name 이 빈 문자열 | 400 |
| E4 | price 가 음수 | 400 |

## E1. 필수 값(name) 누락
요청: `POST /api/products`

준비: 없음

요청
```json
{
  "price": 35000
}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E2. name 이 100자 초과
요청: `POST /api/products`

준비: 없음

요청
```json
{
  "name": "가(101자 문자열)",
  "price": 35000
}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E3. name 이 빈 문자열
요청: `POST /api/products`

준비: 없음

요청
```json
{
  "name": "",
  "price": 35000
}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E4. price 가 음수
요청: `POST /api/products`

준비: 없음

요청
```json
{
  "name": "무선 키보드",
  "price": -1
}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```
