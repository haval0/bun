const worker = new Worker(
  new URL("./myBigNineteenEightiesPerm.js", import.meta.url).href,
  {
    type: "module",
  },
);
