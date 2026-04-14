---
name: git-commit-saboten-author
description: Commit repository changes with the saboten author identity. Use this when asked to create a git commit that should use saboten.pillow@gmail.com as the commit author.
argument-hint: "[commit message] [optional git commit options]"
disable-model-invocation: true
---

# Commit with the saboten author identity

Use this skill when creating a git commit that should be authored as `saboten.pillow@gmail.com <saboten.pillow@gmail.com>`.

## Process

1. Inspect the working tree first with `git status --short`.
2. If there are unrelated modified files, ask before including them.
3. Stage only the files that belong to the intended change unless the user explicitly asks for `-a` or all changes.
4. Do not amend commits unless the user explicitly asks.
5. Use this exact author identity when committing: `--author='saboten.pillow@gmail.com <saboten.pillow@gmail.com>'`

## Inputs

- Commit message: ask for one if the user did not provide it.
- Extra commit options: accept optional extra `git commit` flags, or leave them blank.

## Commit command

When ready to commit, use a command equivalent to:

`git commit [optional extra options] --author='saboten.pillow@gmail.com <saboten.pillow@gmail.com>' -m "[commit message]"`
