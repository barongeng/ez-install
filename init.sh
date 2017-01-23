rm -rf .git
chmod 751 *.sh
git init
git add -A
git commit -m 'update on '$(date +%Y-%m-%d)
git remote add origin git@github.com:zeakey/ez-install
git push -u origin master -f
