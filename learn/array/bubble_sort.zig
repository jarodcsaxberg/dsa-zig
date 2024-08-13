const std = @import("std");

pub fn bubble_sort(arr: *[8]i32) void {
    var i: usize = 0;
    var j: usize = 0;

    while (i < arr.len) : (i += 1) {
        while (j < arr.len - 1 - i) : (j += 1) {
            // need to swap
            if (arr[j] > arr[j + 1]) {
                const tmp: i32 = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = tmp;
            }
        }
        j = 0;
    }
}

const expect = std.testing.expect;

test "bubble_sort" {
    var arr = [8]i32{ 7, 2, 5, 0, 6, 1, 3, 4 };
    bubble_sort(&arr);
    try expect(arr[0] == 0);
    try expect(arr[1] == 1);
    try expect(arr[2] == 2);
    try expect(arr[3] == 3);
    try expect(arr[4] == 4);
    try expect(arr[5] == 5);
    try expect(arr[6] == 6);
    try expect(arr[7] == 7);
}
