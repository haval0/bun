const std = @import("std");
const bun = @import("bun");
const JSC = bun.JSC;
const Permissions = @This();

allow_fs: []const []const u8 = &[_][]const u8{},

pub fn checkFilePermission(this: *Permissions, path: bun.SliceWithUnderlyingString) bool {
    std.debug.print("perms: {s}", .{this.allow_fs[0]});
    // This if check is just bs for now, rewrite to be useful pls
    if (path.slice().len == path.slice().len) {
        return false;
    }
    return true;
}
