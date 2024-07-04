/// Reads a single character from standard input as an integer.
///
/// # Returns
/// An integer representing the character read from standard input.
///
/// # Note
/// This is an unstable function call and should be used internally only.
fn __read_char() -> Int = "__moonbit_io_unstable" "read_char"

/// Converts an integer to a character, if possible.
/// If the host returns -1, this function returns `None` because the compiler optimizes the memory layout of `Option[Char]`.
///
/// # Parameters
/// - `val`: An integer value to be converted to a character.
///
/// # Returns
/// An optional character. Returns `None` if the conversion is not possible or if EOF is reached.
fn char_from_int(val : Int) -> Char? = "%char_from_int"

/// Reads a single character from standard input.
///
/// # Returns
/// An optional character. Returns `None` if EOF is reached.
pub fn read_char() -> Char? {
  char_from_int(__read_char())
}

/// Reads a line of text from standard input.
///
/// # Returns
/// An optional string containing the line of text. Returns `None` if EOF is reached.
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

/// Prints a single character to standard output.
///
/// # Parameters
/// - `c`: The character to be printed.
pub fn print_char(c : Char) = "spectest" "print_char"

/// Prints a displayable object to standard output.
///
/// # Parameters
/// - `obj`: The object to be printed. The object must implement the `Show` trait.
pub fn print(obj : Show) -> Unit {
  obj.to_string().iter().each(fn(ch) { print_char(ch) })
}

/// Prints a displayable object to standard output, followed by a newline.
///
/// # Parameters
/// - `obj`: The object to be printed. The object must implement the `Show` trait.
pub fn println(obj : Show) -> Unit {
  obj.to_string().iter().each(fn(ch) { print_char(ch) })
  print_char('\n')
}
