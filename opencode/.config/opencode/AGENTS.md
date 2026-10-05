# Global tool preferences

- At session start, probe once with `command -v` for: `jq`, `rg`, `gh`, `docker`. Prefer the lightest fitting tool thereafter.
- JSON filtering/aggregation in shell → `jq`, not embedded Python. Python only when the transform genuinely needs a real language.
- File search → dedicated `glob`/`grep` tools, never shell `find`/`grep`. File ops → `read`/`edit`/`write`, never `cat`/`sed`/heredocs.
- Baseline comparisons via a disposable `git worktree` you create yourself (add, verify, then `git worktree remove --force` that same path). Never `git stash` on the working tree, and never remove or otherwise touch any other worktree.
- Verify own solutions by execution (run tests/builds) before claiming success.
