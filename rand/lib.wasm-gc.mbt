/// A standard random number generator from the Rust `rand` crate.
type StdRng

/// Creates a new standard random number generator seeded with the given 32-bit integer.
///
/// # Parameters
/// - `seed`: A 32-bit integer used to seed the random number generator.
///
/// # Returns
/// A new `StdRng` seeded with the provided value.
///
/// # Note
/// This is an unstable function call and should be used internally only.
pub fn stdrng_seed_from_u32(seed : Int) -> StdRng = "__moonbit_rand_unstable" "stdrng_seed_from_u64"

/// Generates a random integer in the range [0, `ubound`).
///
/// # Parameters
/// - `rng`: A `StdRng` instance from the Rust `rand` crate used to generate the random number.
/// - `ubound`: The upper bound (exclusive) for the random number to be generated.
///
/// # Returns
/// A random integer in the range [0, `ubound`).
///
/// # Note
/// This is an unstable function call and should be used internally only.
pub fn stdrng_gen_range(rng : StdRng, ubound : Int) -> Int = "__moonbit_rand_unstable" "stdrng_gen_range"
