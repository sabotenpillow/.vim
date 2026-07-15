---
name: commit-as
description: Commit staged changes to this repo with the saboten.pillow author identity. Use when the user asks to commit here, or says "commit as saboten", or requests a commit with the author option. Defaults to author "saboten.pillow <saboten.pillow@gmail.com>"; an argument can override the author or supply a commit message.
---

# commit-as

Create a git commit in this repository using an explicit `--author` so the
commit is attributed to the personal `saboten.pillow` identity rather than the
global git user.

## Default author

```
saboten.pillow <saboten.pillow@gmail.com>
```

## Steps

1. Check `git status` / `git diff --staged`. If nothing is staged, stage the
   relevant files the user is asking to commit (do not blindly `git add -A` —
   stage only what belongs in this commit). Respect `.gitignore`.
2. Write a concise commit message summarizing the change (imperative subject
   line, optional body explaining the "why"). If the user passed a message in
   the argument, use it.
3. Commit with the author option:

   ```sh
   git commit --author 'saboten.pillow <saboten.pillow@gmail.com>' -m "<subject>" [-m "<body>"]
   ```

4. Confirm the result:

   ```sh
   git log -1 --format='%an <%ae>%n%s'
   ```

## Arguments

The skill argument (if any) may be either:

- **A commit message** — use it as the subject line.
- **An author override** in the form `Name <email>` — use that instead of the
  default author.

If no argument is given, use the default author and write the message yourself.

## Notes

- End the commit message body with the standard co-author trailer only if the
  user's project convention requires it; this repo has not, so omit it unless asked.
- Do not push unless the user explicitly asks.
- If the working tree is on the default branch and the change is substantial,
  mention branching — but for this personal dotfiles repo, committing directly
  to `master` is the norm.
