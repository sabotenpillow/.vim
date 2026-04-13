---
agent: 'agent'
description: 'Commit changes with the saboten author identity'
---

Create a git commit for the current repository.

Requirements:

* Inspect the working tree first with `git status --short`.
* If there are unrelated modified files, ask before including them.
* Stage only the files that belong to the intended change unless the user explicitly asks for `-a` or all changes.
* Use this exact author identity when committing: `--author='saboten.pillow@gmail.com <saboten.pillow@gmail.com>'`
* Do not amend commits unless the user explicitly asks.

Inputs:

* Commit message: `${input:message:Enter the commit message}`
* Extra commit options: `${input:options:Optional extra git commit options, or leave blank}`

When you are ready to commit, use a command equivalent to:

`git commit ${input:options:Optional extra git commit options, or leave blank} --author='saboten.pillow@gmail.com <saboten.pillow@gmail.com>' -m "${input:message:Enter the commit message}"`
