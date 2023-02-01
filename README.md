# Hare freetype2 Bindings

## Vendoring

```
git subtree -P vendor/hare-freetype2/ add https://git.sr.ht/~vladh/hare-freetype2 main
```

## Test

There is a test you can run with `make run`. It expects a font at
`/usr/share/fonts/noto-cjk/NotoSerifCJK-Regular.ttc`. If you don't have a font
there you can edit `cmd/test/main.ha`.
