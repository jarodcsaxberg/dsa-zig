const std = @import("std");

// Given two crystal balls, determine the minimum height (position) they
// can be dropped from to break the ball.
pub fn crystal_balls(breaks: []const bool) usize {
    var pos: usize = 0;
    const jump: usize = std.math.sqrt(breaks.len);

    // jump by sqrt(N) until a break happens
    while (pos < breaks.len) {
        if (breaks[pos]) {
            break;
        }

        pos += jump;
    }

    pos -= jump;

    // walk forward to find the break value
    var j: usize = 0;
    while (j <= jump and pos < breaks.len) : (j += 1) {
        if (breaks[pos]) return pos;

        pos += 1;
    }

    return std.math.maxInt(usize);
}

const expect = std.testing.expect;

test "crystal_ball" {
    const breaks = [_]bool{ false, false, false, false, false, false, false, true, true };
    try expect(crystal_balls(&breaks) == 7);
}

test "crystal_ball_2" {
    const breaks = [_]bool{ false, false, false, false, false, false, false, false, false, true, true, true, true };
    try expect(crystal_balls(&breaks) == 9);
}

test "crystal_ball_fail" {
    const breaks = [_]bool{ false, false, false, false, false, false, false, false, false, false };
    try expect(crystal_balls(&breaks) == std.math.maxInt(usize));
}
