### What is Git ?
- Git is a distributed version control system designed to track changes in source code and coordinate work among multiple developers. It's widely used for software development but can also be applied to any set of files. Here are some key features and concepts:
- Git is a powerful tool that helps manage and track changes in projects, making collaboration more efficient and organized.
  
### Key Features of Git-
- Version Control: Tracks changes to files over time, allowing you to revert to previous versions and see the history of modifications.

- Distributed System: Each developer has a complete copy of the repository, including its full history, on their local machine. This enables offline work and improves collaboration.

- Branching and Merging: Git supports branching, which allows developers to create separate branches for different features or fixes. Branches can be merged back into the main branch when the work is complete.

- Commit Tracking: Changes are recorded in "commits" that contain a snapshot of the project at a given point in time. Each commit has a unique ID (hash) and can include a message describing the changes.

- Collaboration: Multiple developers can work on the same project simultaneously. Git helps manage code conflicts and integrates changes from different sources.

### Basic Git Commands-
- `git init`: Initializes a new Git repository in the current directory.
```
git init
```
- `git clone`: Creates a local copy of an existing remote repository.
```
git clone <repository_url>
git clone "https://github.com/devopsinsiders/starbucks-clone.git"
````
- `git add`: Stages changes (adds files to the next commit).
```
git add <file>
```
- `git commit`: Records the staged changes in the repository with a message.
```
git commit -m "Commit message"
```
- `git status`: Shows the current status of the working directory and staging area.
```
git status
```
- `git push`: Uploads local commits to a remote repository.
```
git push <remote> <branch>
```
- `git pull`: Fetches changes from a remote repository and merges them into the local branch.
```
git pull <remote> <branch>
```

### Git Workflows-
Feature Branch Workflow: Developers create branches for each feature or fix and merge them into the main branch when complete.

Gitflow Workflow: A structured branching model with separate branches for feature development, releases, and hotfixes.

Forking Workflow: Developers create their own copies (forks) of the main repository and submit changes through pull requests.
