const std = @import("std");
const bun = @import("bun");
const JSC = bun.JSC;
const Permissions = @This();

allow_fs: []const []const u8 = &[_][]const u8{},
allow_run: []const []const u8 = &[_][]const u8{},

pub fn checkFilePermission(this: *Permissions, path: bun.SliceWithUnderlyingString) bool {
    std.debug.print("perms: {s}", .{this.allow_fs[0]});
    // This if check is just bs for now, rewrite to be useful pls
    if (path.slice().len == path.slice().len) {
        return false;
    }
    return true;
}

pub fn checkRunPermission(this: *Permissions, argv0: [*:0]const u8) bool {
    std.debug.print("run perms: ", .{});
    for (this.allow_run) |e| {
        std.debug.print("{s}, ", .{e});
        if (std.mem.eql(u8, std.mem.span(argv0), e)) {
            return true;
        }
    }
    std.debug.print("\n", .{});

    return false;
}
