type StdRng

pub fn stdrng_seed_from_u32(seed : Int) -> StdRng = "__moonbit_rand_unstable" "stdrng_seed_from_u64"

pub fn stdrng_gen_range(rng : StdRng, ubound : Int) -> Int = "__moonbit_rand_unstable" "stdrng_gen_range"
