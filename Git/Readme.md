Git (global information tracker)

git is software that serves as a tool for version control, helping developers manage and collaborate on projects efficiently.

GitHub is a platform and a service rather than just a tool or software. 


https://unstop.com/blog/what-is-git

##install wsl-ubuntu on desktop

ubuntu---cantrol panel--programs and feature-----turn windows on and off--click on it---select--windows subsystem for linux---ok--wait for few min..and restart ur system.and now used it.


if not workin--then---search---cmd---> wls --install   and then hit----> wsl --update ----->restart--go to ubuntu---add username--and password on ubuntu.


GIT Lifecycle:


1.INITIALIZEGIT/CLONE REPO

   clone an existing repo using git clone <repo-url>
   OR initializing new repo using git init command ---> .git
   
2. EDIT FILES:-
    Work on ur project file in the working directory.----cd repo---touch new---gglh---
    
3.  STAGE CHANGES:-
   use git add or git add . to stage changes  git add <file_name>....multiple files---add----git add .
   
4. Commit Changes:-
   used git commit -m "commit msg" to save ur changes to local repo.
   
5. Push To Remote :-
   git push
   
6. PULL UPDATES:-
    pull updated code from remote repo using command >>> git pull
    
7.  Branching:-
   create new branch for feature devlopment using >>  git branch <branch name>  ---default--main/master
   
8. merge changes:-
   Mearge feature branches to main branch using git merge
   
9. Resolve Conflict:-
    git log

Git Workflow Explained
---------------------------------------
1. Clone the repository: git clone <repo-url>.
   
2. Create a feature branch: git checkout -b <feature-branch>.

3. Make changes and commit: git add . && git commit -m "Description".

4. Push changes: git push origin <feature-branch>.
   
5. Create a pull/merge request
   
6. Merge the branch into the main branch after review.



Basic commands of Git 
--------------------------------   
    
```bash     
git clone

git init
git add  ----staging area
git add .  ------all file adeed
   
git resotr---unstaging area---untrack
git restore --stage <file-name>

git commit -m "comiit-id"
git config --global user.email "anil@gmail.com"
git config --global user.name "Anil"
git push
   
git revert <commit id>
git revert 5ceca0db....>> git log <show commit id of privious code>

git log
git log --oneline  ------recent changes done on particular dire
   
git remote-----show ur remote repo location
   
git remote -v ----remotee repo url 
     
git branch 'branch-name'
     
git branch 
     
git checkout -b 'branch-name'
     
git switch 'bramch-name'
     
git push origin iata ----push chnages in reture branch...
     
git merge 'source-branch' 'main/master-branch'
```
     
note:- first present in main branch ---then merge ur feture branch
     
after merge--hit git add ,git commit,git push origin main
     
1. Remove a Feature Branch Locally
   
>  Before deleting the branch, ensure you are not currently on it:--
git checkout main
     
Use the following command to delete the branch locally:
     
```bash
git branch -d 'feature-branch-name'
```
      
1. Remove a Feature Branch from GitHub (Remote Repository)
>  To delete the branch from the remote repository:

Delete the Remote Branch Use the following command:-

```bash
 git push origin --delete <feature-branch-name>

     
List all remote branches to confirm the deletion:
 
git branch -r
     
PULLING branch FROM GITHUB
   	
git branch -f 'remote-repo-name' origin/'remote-branch name'
ex- git branch -f test origin/test
```
   	
   	  
     
** GIT RESET, GIT REVERT,
-------------------------------------- 
    
git reset:- 
--------------------
this cmd is used to revert the commit that u did in ur local workspace.

>this cmd reqired commit id
    
note: if we used reset cmd we need commit id of just privious code which is ok..and running well fsg
    
reset cmd used to move changes from commit area to working area.

dis Adv:-
1.it dosent make commit history
2.we cant revert code if we hit hard reset.
3.cant revert single commint
4.once code reset cant be undo that code.
   
type of reset cmd:-
a> soft reset
b> hard reset
    
soft reset:-

```bash
git reset --soft 'commit-id'

ex--git reset  hlhg  ----to show hit >> git log --onelog
 ```
hard reset:- new changes  is full deleted.
 ```bash
git reset --hard 'commit-id' -------not used in real-time-----used soft reset.
```
 
 
GIT REVERT:-
---------------------

 this cmd is used when  we want to revert those commit that we want to go back tha code in working area .
 
 
> if we revert single commit then used revert cmd.
 maintain history of all commit isted of only revert comiit is remove from history.but maintai revert commit id history.
 
>  git reset removes the commit historywhen we are reseting the changes and revert will retain the commit history after reverting the commits.
 
```bash
git revert <commit-id> 
```

----used command ,git log --oneline  to -----show commit -id.
 
Adv:-
 1. maintain comit history
 2. we can bring back our reverted code
 3. used to revert single commit id
 
 
Git RESTOTRE
 
 it is used for remove files from staging area .
 
-------------------------------------------------------------------------------------------------------
 
git fetch:-
 
 download ur remote repo code in ur staging area but not in ur local area..
 
 git fetch -----only show info of ur remote repo new modified files on terminal--i.e---staging area 
 
 -------------------------------------------------------
gitlab
 
 paid---but some feature are free
 
 
 comminity based---free----commercial,---enterprice--

 How to Resolve Conflicts
 -----------------------------------

1. Identify the conflicting files during the merge process.
   
2. Open the files and manually resolve conflicts.
   
3. Mark conflicts as resolved: git add <file-name>.
   
4. Commit the merge: git commit.


How to Merge Repo Branches in GitLab
-------------------------------------------------

1.Navigate to Merge Requests in the GitLab project.

2.Create a new merge request.

3.Review changes and resolve conflicts if necessary.

4.Approve and merge the branch.
