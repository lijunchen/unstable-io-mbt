# Unstable IO for MoonBit

Currently, it only works with the `wasm-gc` backend in `moonrun`.

## Usage

Assume you have already created a MoonBit project by `moon new`. Use the
following command to add this package to your project:

```bash
$ moon add lijunchen/unstable_io
```

### File & Stdio

`./main/moon.pkg.json`:

```json
{
    "is-main": true,
    "import": [
        "lijunchen/unstable_io/io",
        "lijunchen/unstable_io/fs"
    ]
}
```

`./main/main.mbt`:

```moonbit
fn main {
  @io.print("Enter your name: ")
  @io.flush(Stdout)
  let name = @io.read_line_from_stdin().unwrap()
  @fs.write_to_string("test.txt", name)
  let exist = @fs.exists("test.txt")
  @io.println("test.txt exists: \(exist)")
  let content = @fs.read_to_string("test.txt")
  @io.println("content of test.txt: \(content)")
}
```

```
$ moon run main
```

### CLI args

`./main/moon.pkg.json`:

```json
{
    "is-main": true,
    "import": [
        "lijunchen/unstable_io/env"
    ]
}
```

`./main/main.mbt`:

```moonbit
fn main {
  let args = @env.get_args()
  println("args: \(args)")
}
```

```bash
$ moon run main -- a b c
args: [a, b, c]
```

### Environment Variables

```json
{
    "is-main": true,
    "import": [
        "lijunchen/unstable_io/env"
    ]
}
```

```moonbit
fn main {
  let env_var = @env.get_env_var("TEST")
  println("TEST: \(env_var)")
}
```

```bash
$ TEST=123 moon run main
TEST: Some(123)
```
