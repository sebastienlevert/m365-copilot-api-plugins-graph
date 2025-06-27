import { createTypeSpecLibrary } from "@typespec/compiler";

export const $lib = createTypeSpecLibrary({
  name: "api-plugin-graph",
  // Define diagnostics for the library. This will provide a typed API to report diagnostic as well as a auto doc generation.
  diagnostics: {},
  // Defined state keys for storing metadata in decorator.
  state: {},
});

export const { reportDiagnostic, createDiagnostic, stateKeys: StateKeys } = $lib;
