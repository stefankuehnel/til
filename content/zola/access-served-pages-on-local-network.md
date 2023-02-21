+++
title = "Access served pages on local network"
date = 2023-01-01
+++

By default, devices **won't** be able to access served pages from the local
network.

This may be of importance when you want to test page interaction and layout on
your mobile device or tablet. If you set the interface to `0.0.0.0` however,
devices from your local network will be able to access the served pages by
requesting the local ip-address of the machine serving the pages and port used.

```
$ zola serve --interface 0.0.0.0
```

However, in order to have everything work correctly, you might also have to
alter the `base-url` flag to your local ip or set it to `/` to use server-base
relative paths.

## Bibliography

Prouillet, V. (2017). _CLI usage_. Zola. [https://www.getzola.org/documentation/getting-started/cli-usage/#serve](https://www.getzola.org/documentation/getting-started/cli-usage/#serve)
