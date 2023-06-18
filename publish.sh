# # active python on linux
echo "started"
cd /home/yoon/ChatGPT/ChatGPT-blog
/usr/bin/python3 main.py >> /home/yoon/ChatGPT/ChatGPT-blog/main.log 2>&1 

git pull origin main
git config --local user.name "blanc"
git config --local user.email "1yoouoo@gmail.com" 
sleep 0.1
git add -A
git commit -m "publish blog"
git push origin HEAD


# active python on mac
# cd /Users/blanc/Documents/ChatGPT/ChatGPT-blog
# /opt/homebrew/bin/python3 main.py >> /Users/blanc/Documents/ChatGPT/ChatGPT-blog/main.log 2>&1

# git config --local user.name "blanc"
# git config --local user.email "1yoouoo@gmail.com" 
# sleep 0.1
# git add -A
# git commit -m "publish blog"
# git push origin HEAD