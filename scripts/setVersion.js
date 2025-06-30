#!/usr/bin/env node
/* eslint-env node */

import { readFileSync, writeFileSync } from "fs";
import { execSync } from "child_process";
import { fileURLToPath } from "url";
import { dirname, join } from "path";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

/**
 * Sets the package version based on the latest git tag
 */
function setVersionFromTag() {
  try {
    // Get the latest git tag
    const tag = execSync("git describe --tags --abbrev=0", { encoding: "utf8" }).trim();

    // Remove 'v' prefix if present (e.g., v1.0.0 -> 1.0.0)
    const version = tag.startsWith("v") ? tag.slice(1) : tag;

    // Validate version format (basic semver check)
    const semverRegex = /^\d+\.\d+\.\d+(-[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*)?(\+[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*)?$/;
    if (!semverRegex.test(version)) {
      throw new Error(`Invalid version format: ${version}. Expected semantic version (e.g., 1.0.0)`);
    }

    // Read package.json
    const packageJsonPath = join(__dirname, "..", "package.json");
    const packageJson = JSON.parse(readFileSync(packageJsonPath, "utf8"));

    // Store old version for logging
    const oldVersion = packageJson.version;

    // Update version
    packageJson.version = version;

    // Write back to package.json
    writeFileSync(packageJsonPath, JSON.stringify(packageJson, null, 2) + "\n");

    console.log(`✅ Version updated from ${oldVersion} to ${version}`);
    console.log(`📦 Package version set to: ${version}`);
    console.log(`🏷️  Based on git tag: ${tag}`);
  } catch (error) {
    if (error.message.includes("git describe")) {
      console.error("❌ No git tags found. Please create a tag first (e.g., git tag v1.0.0)");
    } else {
      console.error(`❌ Error setting version: ${error.message}`);
    }
    process.exit(1);
  }
}

/**
 * Sets a specific version (used when version is provided as argument)
 */
function setSpecificVersion(version) {
  try {
    // Validate version format
    const semverRegex = /^\d+\.\d+\.\d+(-[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*)?(\+[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*)?$/;
    if (!semverRegex.test(version)) {
      throw new Error(`Invalid version format: ${version}. Expected semantic version (e.g., 1.0.0)`);
    }

    // Read package.json
    const packageJsonPath = join(__dirname, "..", "package.json");
    const packageJson = JSON.parse(readFileSync(packageJsonPath, "utf8"));

    // Store old version for logging
    const oldVersion = packageJson.version;

    // Update version
    packageJson.version = version;

    // Write back to package.json
    writeFileSync(packageJsonPath, JSON.stringify(packageJson, null, 2) + "\n");

    console.log(`✅ Version updated from ${oldVersion} to ${version}`);
    console.log(`📦 Package version manually set to: ${version}`);
  } catch (error) {
    console.error(`❌ Error setting version: ${error.message}`);
    process.exit(1);
  }
}

// Main execution
const args = process.argv.slice(2);

if (args.length === 0) {
  // No arguments - use git tag
  console.log("🔍 Looking for latest git tag...");
  setVersionFromTag();
} else if (args.length === 1) {
  // One argument - use specific version
  const version = args[0];
  console.log(`🔧 Setting specific version: ${version}`);
  setSpecificVersion(version);
} else {
  // Too many arguments
  console.error("❌ Usage: node setVersion.js [version]");
  console.error("   Examples:");
  console.error("     node setVersion.js        # Use latest git tag");
  console.error("     node setVersion.js 1.2.3  # Set specific version");
  process.exit(1);
}
