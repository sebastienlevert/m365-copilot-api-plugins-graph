// @ts-check
import eslint from "@eslint/js";
import tsEslint from "typescript-eslint";
import globals from "globals";

export default tsEslint.config(
  {
    ignores: ["**/dist/**/*", "**/.temp/**/*"],
  },
  eslint.configs.recommended,
  ...tsEslint.configs.recommended,
  {
    languageOptions: {
      globals: {
        ...globals.node,
      },
    },
  },
);
