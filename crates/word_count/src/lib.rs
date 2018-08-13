#[macro_use]
extern crate helix;

ruby! {
    class WordCount {
        def from_characters(characters: f64) -> i64 {
            const CHARACTERS_PER_WORD: f64 = 5.175;
            let exact = characters / CHARACTERS_PER_WORD;
            let exact = exact as i64;
            return exact;
        }
    }
}
