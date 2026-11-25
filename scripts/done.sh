#!/bin/bash
# 머지 후 정리: main 최신화 + GitHub 에서 지워진 브랜치를 내 PC 에서도 삭제
git switch main && git pull origin main && git fetch --prune
for b in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do
  git branch -D "$b"
done
echo "✅ 정리 완료"; git branch
