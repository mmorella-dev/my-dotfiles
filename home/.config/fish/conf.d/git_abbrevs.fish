# git abbreviations
# based on jhillyerd/plugin-git
if command -q git
    abbr -a -g g git
    abbr -a -g ga git add
    abbr -a -g gaa git add --all
    abbr -a -g gapa git add --patch
    abbr -a -g gap git apply
    abbr -a -g gb git branch -vv
    abbr -a -g gba git branch -a -v
    abbr -a -g gban git branch -a -v --no-merged
    abbr -a -g gbd git branch -d
    abbr -a -g gbD git branch -D
    abbr -a -g gbl git blame -b -w
    abbr -a -g gbs git bisect
    abbr -a -g gbsb git bisect bad
    abbr -a -g gbsg git bisect good
    abbr -a -g gbsr git bisect reset
    abbr -a -g gbss git bisect start
    abbr -a -g gc git commit -v
    abbr -a -g gc! git commit -v --amend
    abbr -a -g gcn! git commit -v --no-edit --amend
    abbr -a -g gca git commit -v -a
    abbr -a -g gca! git commit -v -a --amend
    abbr -a -g gcan! git commit -v -a --no-edit --amend
    abbr -a -g gcv git commit -v --no-verify
    abbr -a -g gcav git commit -a -v --no-verify
    abbr -a -g gcav! git commit -a -v --no-verify --amend
    abbr -a -g gcm git commit -m
    abbr -a -g gcam git commit -a -m
    abbr -a -g gscam git commit -S -a -m
    abbr -a -g gcl git clone
    abbr -a -g gcount git shortlog -sn
    abbr -a -g gcp git cherry-pick
    abbr -a -g gcpa git cherry-pick --abort
    abbr -a -g gcpc git cherry-pick --continue
    abbr -a -g gd git diff
    abbr -a -g gdca git diff --cached
    abbr -a -g gds git diff --stat
    abbr -a -g gdsc git diff --stat --cached
    abbr -a -g gdw git diff --word-diff
    abbr -a -g gdwc git diff --word-diff --cached
    abbr -a -g gignore git update-index --assume-unchanged
    abbr -a -g gf git fetch
    abbr -a -g gfa git fetch --all --prune
    abbr -a -g gfm "git fetch origin master --prune; and git merge FETCH_HEAD"
    abbr -a -g gfo git fetch origin
    abbr -a -g gl git pull
    abbr -a -g gll git pull origin
    abbr -a -g glr git pull --rebase
    abbr -a -g glg git log --stat --max-count=10
    abbr -a -g glgg git log --graph --max-count=10
    abbr -a -g glgga git log --graph --decorate --all
    abbr -a -g glo git log --oneline --decorate --color
    abbr -a -g glog git log --oneline --decorate --color --graph
    abbr -a -g glom git log --oneline --decorate --color master..
    abbr -a -g glod git log --oneline --decorate --color develop..
    abbr -a -g gloo "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
    abbr -a -g gm git merge
    abbr -a -g gmt git mergetool --no-prompt
    abbr -a -g gp git push
    abbr -a -g gp! git push --force-with-lease
    abbr -a -g gpo git push origin
    abbr -a -g gpo! git push --force-with-lease origin
    abbr -a -g gpv git push --no-verify
    abbr -a -g gpv! git push --no-verify --force-with-lease
    abbr -a -g ggp! ggp --force-with-lease
    abbr -a -g gpu ggp --set-upstream
    abbr -a -g gr git remote -vv
    abbr -a -g gra git remote add
    abbr -a -g grb git rebase
    abbr -a -g grba git rebase --abort
    abbr -a -g grbc git rebase --continue
    abbr -a -g grbi git rebase --interactive
    abbr -a -g grbm git rebase master
    abbr -a -g grbmi git rebase master --interactive
    abbr -a -g grbmia git rebase master --interactive --autosquash
    abbr -a -g grbd git rebase develop
    abbr -a -g grbdi git rebase master --interactive
    abbr -a -g grbdia git rebase master --interactive --autosquash
    abbr -a -g grbs git rebase --skip
    abbr -a -g grev git revert
    abbr -a -g grh git reset
    abbr -a -g grhh git reset --hard
    abbr -a -g grm git rm
    abbr -a -g grmc git rm --cached
    abbr -a -g grmv git remote rename
    abbr -a -g grrm git remote remove
    abbr -a -g grs git restore
    abbr -a -g grset git remote set-url
    abbr -a -g grss git restore --source
    abbr -a -g grup git remote update
    abbr -a -g grv git remote -v
    abbr -a -g gsh git show
    abbr -a -g gsd git svn dcommit
    abbr -a -g gsr git svn rebase
    abbr -a -g gss git status -s
    abbr -a -g gst git status
    abbr -a -g gsta git stash
    abbr -a -g gstd git stash drop
    abbr -a -g gstp git stash pop
    abbr -a -g gsts git stash show --text
    abbr -a -g gsu git submodule update
    abbr -a -g gsur git submodule update --recursive
    abbr -a -g gsuri git submodule update --recursive --init
    abbr -a -g gts git tag -s
    abbr -a -g gtv git tag | sort -V
    abbr -a -g gsw git switch
    abbr -a -g gswc git switch --create
    abbr -a -g gunignore git update-index --no-assume-unchanged
    abbr -a -g gup git pull --rebase
    abbr -a -g gwch git whatchanged -p --abbrev-commit --pretty=medium

    # git checkout abbreviations
    abbr -a -g gco git checkout
    abbr -a -g gcb git checkout -b
    abbr -a -g gcod git checkout develop
    abbr -a -g gcom git checkout master

    # git flow abbreviations
    abbr -a -g gfb git flow bugfix
    abbr -a -g gff git flow feature
    abbr -a -g gfr git flow release
    abbr -a -g gfh git flow hotfix
    abbr -a -g gfs git flow support

    abbr -a -g gfbs git flow bugfix start
    abbr -a -g gffs git flow feature start
    abbr -a -g gfrs git flow release start
    abbr -a -g gfhs git flow hotfix start
    abbr -a -g gfss git flow support start

    abbr -a -g gfbt git flow bugfix track
    abbr -a -g gfft git flow feature track
    abbr -a -g gfrt git flow release track
    abbr -a -g gfht git flow hotfix track
    abbr -a -g gfst git flow support track

    abbr -a -g gfp git flow publish
end