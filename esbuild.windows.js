const esbuild = require("esbuild");
const glob = require("glob");

let inputFiles = glob.sync("app/javascript/*.*");
esbuild.build({
  entryPoints: inputFiles,
  outdir: "app/assets/builds",
  bundle: true,
  sourcemap: true,
  watch: {
    onRebuild(error, result) {
      if (error) console.error("watch build failed:", error);
      else console.log("watch build succeeded:", result);
    },
  },
});
