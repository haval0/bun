const bun = @import("bun");

pub fn checkFilePermission(path: bun.SliceWithUnderlyingString) bool {
    // This if check is just bs for now, rewrite to be useful pls
    if (path.slice().len == path.slice().len) {
        return false;
    }
    return true;
}
