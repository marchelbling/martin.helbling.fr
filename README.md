# Martin

Spelling and phoneme practice apps.

## Requirements

* make
* node (lts)
* uv (for audio generation)

Install everything via [mise](https://mise.jdx.dev/): `mise install`.

## Build

```
$ make build
```

## Serve locally

```
$ make local
```

Then open http://localhost:8000.

## Regenerate audio

```
$ make words-audio
$ make phonemes-audio
```

## Update blog

```
$ make deploy
```
