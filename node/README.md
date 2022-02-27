# vrm-validator

This is an npm package for the [VRM Validator](https://github.com/mrxz/glTF-Validator/) by [Fern Solutions](https://fern.solutions) compiled from Dart to JS.

## Installation

```
npm install --save vrm-validator
```

## Examples

### Basic usage (Node.js)

```javascript
const fs = require('fs');
const validator = require('vrm-validator');

const asset = fs.readFileSync('./Avatar-1.0-beta.vrm');

validator.validateBytes(new Uint8Array(asset))
    .then((report) => console.info('Validation succeeded: ', report))
    .catch((error) => console.error('Validation failed: ', error));
```

### Basic usage (Browser)

```javascript
const validator = require('vrm-validator');

fetch('Avatar-1.0-beta.vrm')
    .then((response) => response.arrayBuffer())
    .then((asset) => validator.validateBytes(new Uint8Array(asset)))
    .then((report) => console.info('Validation succeeded: ', report))
    .catch((error) => console.error('Validation failed: ', error));
```

## API
