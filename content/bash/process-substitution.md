+++
title = "Process substitution"
date = 2023-01-20
+++

Process substitution is a feature in `bash` that allows the output of a command or process to be used as input to another command or process, eliminating the need to write the output to a temporary file first. This is achieved by utilizing the special syntax `<()` on the command line.

For example, consider the following command:

```
gpg --encrypt --hidden-recipient-file <(curl -sL https://example.com/hidden-recipient.gpg) --output message.gpg message.txt
```

This command utilizes the `gpg` command to encrypt the file `message.txt`, using the recipient's public key that is downloaded via `curl` from the specified URL, and uses `bash` process substitution with `<()` to pass the contents of the downloaded file to the `--hidden-recipient-file` option of `gpg`.

In summary, process substitution is an efficient way to use the output of a command as input to another command, without the need to write the output to a temporary file first.

## Bibliography

Cooper, M. (2006). _Advanced Bash-Scripting Guide_. Advanced Bash-Scripting Guide. [https://linux.die.net/abs-guide/process-sub.html](https://linux.die.net/abs-guide/process-sub.html)
