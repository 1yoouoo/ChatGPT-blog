echo "started"

# 브랜치 이름 배열
BRANCHES=("nextjs" "javascript" "react")

# 배열에서 랜덤하게 브랜치 이름 선택
BRANCH=${BRANCHES[$RANDOM % ${#BRANCHES[@]}]}

cd /Users/blanc/Documents/ChatGPT/ChatGPT-blog
# 선택한 브랜치로 checkout

echo "$BRANCH 입니다."

git checkout $BRANCH

./publish.sh