# 예외 테스트 작성 지침서
- 명세의 **에러 응답마다 케이스 하나**. 파일명은 명세와 같게 `docs/api-tests/<기능명>.md`.
- 요청 body JSON 과 기대 응답 JSON 만 쓴다. 응답은 명세와 글자까지 같게.
- JSON 은 한 줄로 쓰지 않고, 필드마다 줄을 나누고 2칸 들여쓴다.

````markdown
# 회원가입 예외 테스트
- 요청: `POST /api/members`

| 번호 | 상황 | 기대 status |
|---|---|---|
| E1 | 이미 가입된 이메일 | 409 |

## E1. 이미 가입된 이메일
준비: 같은 이메일로 먼저 가입

요청
```json
{
  "email": "user@example.com",
  "password": "abcd1234",
  "nickname": "gygim"
}
```

응답 `409`
```json
{
  "status": 409,
  "message": "이미 사용 중인 이메일입니다."
}
```
````
