echo "started"

# 브랜치 이름 배열
BRANCHES=("nextjs" "javascript" "react" "python" "java" "spring" "vue" "redux" "main")

# 배열에서 랜덤하게 브랜치 이름 선택
BRANCH=${BRANCHES[$RANDOM % ${#BRANCHES[@]}]}

# active python on linux
cd /home/yoon/ChatGPT/ChatGPT-blog

# active python on mac
# cd /Users/blanc/Documents/ChatGPT/ChatGPT-blog


echo "$BRANCH 입니다."

git checkout $BRANCH
sleep 0.1
./publish.sh


