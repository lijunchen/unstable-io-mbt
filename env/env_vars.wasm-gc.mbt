/// Retrieves the value of an environment variable.
///
/// # Parameters
/// - `s`: An `ExternString` representing the name of the environment variable.
///
/// # Returns
/// An `ExternString` containing the value of the environment variable.
///
/// # Note
/// This is an unstable function call and should be used internally only.
fn env_get_var(s : @ffi.ExternString) -> @ffi.ExternString = "__moonbit_fs_unstable" "env_get_var"

/// Retrieves the command-line arguments.
///
/// # Returns
/// A `JSArray` containing the command-line arguments.
///
/// # Note
/// This is an unstable function call and should be used internally only.
fn args_get() -> @ffi.JSArray = "__moonbit_fs_unstable" "args_get"

/// Gets the value of an environment variable.
///
/// # Parameters
/// - `name`: A `String` representing the name of the environment variable.
///
/// # Returns
/// An optional `String` containing the value of the environment variable. Returns `None` if the variable is not set.
pub fn get_env_var(name : String) -> String? {
  let res = env_get_var(@ffi.string_to_extern(name))
  let mbt_string = @ffi.string_from_extern(res)
  if mbt_string == "" {
    None
  } else {
    Some(mbt_string)
  }
}

/// Gets the command-line arguments.
///
/// # Returns
/// An array of `String` containing the command-line arguments.
pub fn get_args() -> Array[String] {
  let arr = args_get()
  let len = @ffi.array_len(arr)
  let res = []
  for i = 0; i < len; i = i + 1 {
    let val = arr[i]
    if @ffi.jsvalue_is_string(val).not() {
      abort("Expected all strings in array")
    }
    res.push(@ffi.string_from_extern(@ffi.jsvalue_get_string(val)))
  }
  res
}
