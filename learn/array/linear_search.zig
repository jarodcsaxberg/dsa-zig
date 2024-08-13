const std = @import("std");

pub fn linear_search(haystack: []const u8, needle: u8) bool {
    for (haystack) |item| {
        if (item == needle) {
            return true;
        }
    }

    return false;
}

const expect = std.testing.expect;

test "linear_search_true" {
    const haystack = [_]u8{ 0, 1, 2, 3, 4, 5 };
    try expect(linear_search(&haystack, 5) == true);
}

test "linear_search_false" {
    const haystack = [_]u8{ 0, 1, 2, 3, 4, 5 };
    try expect(linear_search(&haystack, 9) == false);
}
