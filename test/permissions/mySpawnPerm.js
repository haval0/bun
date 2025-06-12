const proc = Bun.spawn(["echo", "hello"]);
const text = await new Response(proc.stdout).text();
console.log(text);
