const std = @import("std");

pub fn binary_search(haystack: []const usize, needle: usize) bool {
    var pos = haystack.len >> 1;

    while (true) {
        if (pos < 0) {
            break;
        }

        if (pos >= haystack.len) {
            break;
        }

        // if needle is larger than value at pos, go right
        if (needle > haystack[pos]) {
            pos += pos >> 1;
        }
        // else if needle is smaller, go left
        else if (needle < haystack[pos]) {
            pos -= pos >> 1;
        }
        // else, return true
        else {
            return true;
        }
    }

    return false;
}

const expect = std.testing.expect;

test "binary_search_true" {
    const haystack = [_]usize{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
    try expect(binary_search(&haystack, 9) == true);
}

test "binary_search_false" {
    const haystack = [_]usize{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
    try expect(binary_search(&haystack, 20) == false);
}
