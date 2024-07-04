/// Exits the program with the given exit code.
///
/// # Parameters
/// - `code`: An integer representing the program's exit status code.
///
/// # Examples
/// ```
/// @sys.exit(0); // Normal exit
/// @sys.exit(1); // Error exit
/// ```
///
/// # Note
/// This is an unstable system call and should be used internally only.
pub fn exit(code : Int) = "__moonbit_sys_unstable" "exit"
