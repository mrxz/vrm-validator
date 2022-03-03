# vrm-validator

Tool to validate [VRM](https://vrm.dev/en/) ([glTF](https://github.com/KhronosGroup/glTF) + VRM extensions) assets.

[Try it out in your browser](https://vrm-validator.fern.solutions/)

This project is a fork of the official [glTF-validator](https://github.com/KhronosGroup/glTF-Validator), expanded to valdiate .vrm files.
Validation is performed against [glTF 2.0](https://github.com/KhronosGroup/glTF/tree/master/specification/2.0) specification and [VRM 1.0-beta](https://github.com/vrm-c/vrm-specification/tree/master/specification/VRMC_vrm-1.0-beta) specification.

Validator writes a validation report (in JSON-format) with all found issues and asset stats.

## Implemented features

- JSON syntax check and [GLBv2](https://www.khronos.org/registry/glTF/specs/2.0/glTF-2.0.html#glb-file-format-specification) file format correctness.
- Asset description validation
  - All properties and their types from JSON-Schemas (including implicit limitations on valid values).
  - Validity and compatibility of internal references.
  - Correctness of Data URI encoding.
- Binary buffers validation
  - Forbidden or incorrect accessor values (e.g., `NaN`, invalid quaternions, indecomposable matrices, etc).
  - `accessor.min` and `accessor.max` values.
  - Sparse accessors encoding.
  - Animation inputs and outputs.
- Images validation
  - Warning on non-power-of-two dimensions.
  - Warning on unsupported image features (like animations or custom color spaces).
- VRM extension validation
- Extensions validation
  - EXT_texture_webp
  - KHR_animation_pointer (partial)
  - KHR_lights_punctual
  - KHR_materials_anisotropy
  - KHR_materials_clearcoat
  - KHR_materials_dispersion
  - KHR_materials_emissive_strength
  - KHR_materials_ior
  - KHR_materials_iridescence
  - KHR_materials_pbrSpecularGlossiness
  - KHR_materials_sheen
  - KHR_materials_specular
  - KHR_materials_transmission
  - KHR_materials_unlit
  - KHR_materials_variants
  - KHR_materials_volume
  - KHR_mesh_quantization
  - KHR_texture_transform
  - VRMC_materials_mtoon
  - VRMC_springBone
  - VRMC_vrm
- [Full list of detectable issues](ISSUES.md).

## Usage

You can use hosted [web front-end tool](https://vrm-validator.fern.solutions/). It works completely in the browser without any server-side processing.

#### Command Line Tool Usage
```text
Usage: vrm_validator [<options>] <input>

Validation report will be written to `<asset_filename>.report.json`.
If <input> is a directory, validation reports will be recursively created for each *.gltf, *.glb or *.vrm asset.

Validation log will be printed to stderr.

Shell return code will be non-zero if at least one error was found.
-o, --[no-]stdout                Print JSON report to stdout instead of writing it to a file. This option cannot be used with directory input.
-r, --[no-]validate-resources    Validate contents of embedded and/or referenced resources (buffers, images).
                                 (defaults to on)
-t, --[no-]write-timestamp       Write UTC timestamp to the validation report.
-p, --[no-]absolute-path         Write absolute asset path to the validation report.
-m, --[no-]messages              Print issue messages to stderr. Otherwise, only total number of issues will be printed.
-a, --[no-]all                   Print all issue messages to stderr. Otherwise, only errors will be printed. Implies --messages.
-c, --config                     YAML configuration file with validation options. See docs/config-example.yaml for details.
-h, --threads                    The number of threads for directory validation. Set to 0 (default) for auto selection.
```

## Building

### Prerequisites

1. Download and install [Dart SDK](https://dart.dev/tools/sdk/archive) for your platform.
2. Add Dart SDK `bin` directory to your PATH.
3. From the repository root directory, run `dart pub get` to get dependencies.

#### Fetching dependencies from behind a corporate firewall

`dart pub get` downloads dependencies from Google's `pub.dev` server over HTTPS. If you need to specify a proxy, follow these steps:

1. Set `https_proxy` or `HTTPS_PROXY` environment variable in form `hostname:port`.
2. If the proxy requires credentials, use this syntax: `username:password@hostname:port`.

`dart pub get` validates server's SSL certificate. If your corporate network interferes with SSL connections, follow these steps to get it running.

1. Save your corporate self-signed root certificate as X.509 file.
2. (Linux only) Try to add your cert to `/etc/pki/tls/certs/ca-bundle.crt` or `/etc/ssl/certs`.
3. If that doesn't work or if you're on Windows, add environment variable `DART_VM_OPTIONS` with value `--root-certs-file=<cert_file>`.

After doing this, `dart pub get` should be able to download dependencies successfully.

#### Clearing Caches

In rare cases, you may encounter various build issues usually caused by previously cached artifacts and/or packages. To clear all caches and re-download the dependencies, do the following steps:

1. Remove the `.dart_tool` directory and the `pubspec.lock` file from the project root directory.
2. Run `dart pub cache clean --force`.
3. Run `dart pub get`.

### Drag-n-Drop Web Tool

To build the drag-n-drop online validation tool (as hosted [here](https://vrm-validator.fern.solutions/)), follow these steps after installation:

1. Run `dart run grinder web`.
2. All needed files will be written to `build/web` directory.

To build and package the drag-n-drop online validation tool, follow these steps after installation:

1. Run `dart run grinder web-archive`.
2. An archive will be written to the `build/gltf_validator-VERSION-web.zip` file.

### CLI tool

To build the CLI tool, follow these steps after installation:

1. Run `dart run grinder exe`.
2. Native executable file will be written to `build/bin/gltf_validator` (Linux and macOS) or `build/bin/gltf_validator.exe` (Windows).

To build and package the CLI tool, follow these steps after installation:

1. Run `dart run grinder exe-archive`.
2. An archive will be written to the `build/gltf_validator-VERSION-PLATFORM.tar.xz` (Linux and macOS) or `build/gltf_validator-VERSION-PLATFORM.zip` (Windows) file.

### NPM Package

To build an npm package for use in Node.js environment, follow these steps after installation:

1. Run `dart run grinder npm`.
2. `gltf-validator` npm package will be written to `build/node`.

Refer to the [npm package documentation](https://www.npmjs.com/package/vrm-validator) for additional information.

#### Publishing

To publish an npm package, follow these steps after installation:

1. Run `dart run grinder npm-publish`.
2. `gltf-validator` npm package will be built to `build/node` and published to npm registry using `npm publish`.

### Validation Issues List

To generate [ISSUES.md](ISSUES.md), follow these steps after installation:

1. Run `dart run grinder issues`.
2. `ISSUES.md` file will be written to the repo root.

## Contributing

Before making a pull request do the following steps:

1. Run `dart format .` (note the dot) to format all source files.
2. Run `dart analyze` to check that there are no analyzer issues.
3. Run `dart test` to check that the tests pass.
4. Run `dart run grinder all` to check that all targets build.
