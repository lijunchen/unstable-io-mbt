fn __read_char() -> Int = "__moonbit_io_unstable" "read_char"

fn char_from_int(val : Int) -> Char? = "%char_from_int"

pub fn read_char() -> Char? {
  char_from_int(__read_char())
}

pub fn read_line_from_stdin() -> String? {
  let buf = Buffer::new()
  while true {
    let c = read_char()
    match c {
      None => return None
      Some('\n') => {
        buf.write_char('\n')
        break
      }
      Some(c) => buf.write_char(c)
    }
  }
  Some(buf.to_string())
}

pub fn print_char(c : Char) = "spectest" "print_char"

pub fn print(obj : Show) -> Unit {
  obj.to_string().iter().each(fn(ch) { print_char(ch) })
}

pub fn println(obj : Show) -> Unit {
  obj.to_string().iter().each(fn(ch) { print_char(ch) })
  print_char('\n')
}
