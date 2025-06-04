const std = @import("std");
const bun = @import("bun");
const JSC = bun.JSC;
const Permissions = @This();

allow_fs: []const []const u8 = &[_][]const u8{},
allow_run: []const []const u8 = &[_][]const u8{},

fn realpath(cwd: []const u8, path: []const u8) []const u8 {
    return if (std.fs.path.isAbsolute(path)) path else bun.path.join(&[_][]const u8{ cwd, path }, .auto);
}

pub fn checkFilePermission(this: *Permissions, cwd: []const u8, path: []const u8) bool {
    for (this.allow_fs) |e| {
        // isParentOrEqual does not work with `/` as the parent
        switch (bun.path.isParentOrEqual(realpath(cwd, e), realpath(cwd, path))) {
            .parent, .equal => return true,
            else => {},
        }
    }
    return false;
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
