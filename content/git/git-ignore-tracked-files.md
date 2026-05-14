+++
title = "Git ignore tracked files"
date = 2026-05-14
+++

Sometimes a base configuration file (e.g. `config.yaml`) imports an additional
configuration file (e.g. `config.extend.yaml`) that allows overriding settings
in the base configuration. The additional configuration file's contents must not
be committed, however, because they contain local overrides that other consumers
of the repository likely neither want nor need.

## Problem

This creates a dilemma: the additional configuration file must be tracked so that
fresh clones don't break, but its changes must also be ignored so they don't get
committed back into the upstream repository.

## Solution

Git's `git-update-index` command with the `--skip-worktree` flag tells Git to ignore local changes to a tracked
file. The file remains in the repository and still receives upstream updates,
but your local modifications won't appear in `git status`, `git diff`, or be
accidentally committed.

To ignore changes to a tracked file:

```bash
git update-index --skip-worktree config.extend.yaml
```

To undo and start tracking changes again:

```bash
git update-index --no-skip-worktree config.extend.yaml
```

### How it works

`--skip-worktree` tells Git that the working tree version of the file should
be treated as always matching the index. Git skips stat checks on the file,
so `git status` reports nothing, `git add` considers it already up-to-date,
and commands that would normally overwrite local changes (like
`git reset --hard`) leave the file untouched.

This flag was specifically designed for use cases like local configuration
overrides — tracked files that developers need to customize locally without
risking accidental commits back to the upstream repository.

### Caveats

- The flag is **local** to your clone. Other contributors must run the same
  command on their machines if they want the same behavior.

- If the upstream version changes while you have local modifications,
  `git pull` will fail. You'll need to temporarily unset the flag, resolve,
  and re-apply it.

- To see which files are currently skipped:

  ```bash
  git ls-files -v | grep '^S'
  ```

## Bibliography

FallenGameR. (2011). git assume-unchanged vs skip-worktree. In *LiveJournal*.
[https://fallengamer.livejournal.com/93321.html](https://fallengamer.livejournal.com/93321.html)

Git: Ignore tracked files. (2012). In *Stack Overflow*.
[https://stackoverflow.com/a/73720550](https://stackoverflow.com/a/73720550)
