// vite.config.js
import vitePluginString from "vite-plugin-string";
import { resolve } from "path";
import { defineConfig } from "vite";

export default defineConfig({
  build: {
    rollupOptions: {
      input: {
        main: resolve(__dirname, "index.html"),
        nested: resolve(__dirname, "pages/flag/index.html"),
      },
    },
  },
  plugins: [vitePluginString()],
});
