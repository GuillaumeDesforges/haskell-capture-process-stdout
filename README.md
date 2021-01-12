# haskell-capture-process-stdout
Trying to capture a subprocess stdout in Haskell

This small code does not work!

```
run a bash
Running bash command with config: Config {stdout = Just {handle: <file descriptor: 4>}}
Executed bash command, got exit code ExitSuccess
  works and writes to handle FAILED [1]

Failures:

  test/Spec.hs:17:7: 
  1) run a bash works and writes to handle
       expected: "Hello world!"
        but got: ""

  To rerun use: --match "/run a bash/works and writes to handle/"

Randomized with seed 1102823477

Finished in 0.0020 seconds
1 example, 1 failure
```

Please help me!
