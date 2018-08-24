# glTF 2.0 Validation Issues
## IoError
| Code | Message | Severity |
|------|---------|----------|
|FILE_NOT_FOUND|File not found. `%1`|Error|
## SchemaError
| Code | Message | Severity |
|------|---------|----------|
|ARRAY_LENGTH_NOT_IN_LIST|Invalid array length `%1`. Valid lengths are: ('`%a`', '`%b`', '`%c`').|Error|
|ARRAY_TYPE_MISMATCH|Type mismatch. Array element '`%1`' is not a '`%2`'.|Error|
|DUPLICATE_ELEMENTS|Duplicate element.|Error|
|EMPTY_ENTITY|Entity cannot be empty.|Error|
|INVALID_INDEX|Index must be a non-negative integer.|Error|
|INVALID_JSON|Invalid JSON data. Parser output: `%1`|Error|
|INVALID_URI|Invalid URI '`%1`'. Parser output: `%2`|Error|
|ONE_OF_MISMATCH|Exactly one of ('`%1`', '`%2`', '`%3`', '`%4`') properties must be defined.|Error|
|PATTERN_MISMATCH|Value '`%1`' does not match regexp pattern '`%2`'.|Error|
|TYPE_MISMATCH|Type mismatch. Property value '`%1`' is not a '`%2`'.|Error|
|UNDEFINED_PROPERTY|Property '`%1`' must be defined.|Error|
|UNEXPECTED_PROPERTY|Unexpected property.|Warning|
|UNSATISFIED_DEPENDENCY|Dependency failed. '`%1`' must be defined.|Error|
|VALUE_MULTIPLE_OF|Value `%1` is not a multiple of `%2`.|Error|
|VALUE_NOT_IN_LIST|Invalid value '`%1`'. Valid values are ('`%a`', '`%b`', '`%c`').|Warning|
|VALUE_NOT_IN_RANGE|Value `%1` is out of range.|Error|
## SemanticError
| Code | Message | Severity |
|------|---------|----------|
|ACCESSOR_MATRIX_ALIGNMENT|Matrix accessors must be aligned to 4-byte boundaries.|Error|
|ACCESSOR_NORMALIZED_INVALID|Only (u)byte and (u)short accessors can be normalized.|Error|
|ACCESSOR_OFFSET_ALIGNMENT|Offset `%1` is not a multiple of componentType length `%2`.|Error|
|ACCESSOR_SPARSE_COUNT_OUT_OF_RANGE|Sparse accessor overrides more elements (`%1`) than the base accessor contains (`%2`).|Error|
|ASSET_MIN_VERSION_GREATER_THAN_VERSION|Asset minVersion '`%1`' is greater than version '`%2`'.|Warning|
|BUFFER_DATA_URI_MIME_TYPE_INVALID|Buffer's Data URI MIME-Type must be 'application/octet-stream' or 'application/gltf-buffer'. Found '`%1`' instead.|Error|
|BUFFER_VIEW_INVALID_BYTE_STRIDE|Only buffer views with raw vertex data can have byteStride.|Error|
|BUFFER_VIEW_TOO_BIG_BYTE_STRIDE|Buffer view's byteStride (`%1`) is smaller than byteLength (`%2`).|Error|
|CAMERA_XMAG_YMAG_ZERO|xmag and ymag must not be zero.|Warning|
|CAMERA_ZFAR_LEQUAL_ZNEAR|zfar must be greater than znear.|Error|
|INTEGER_WRITTEN_AS_FLOAT|Integer value is written with fractional part: `%1`.|Warning|
|INVALID_GL_VALUE|Invalid value `%1` for GL type '`%2`'.|Error|
|MATERIAL_ALPHA_CUTOFF_INVALID_MODE|Alpha cutoff is supported only for 'MASK' alpha mode.|Warning|
|MESH_INVALID_WEIGHTS_COUNT|The length of weights array (`%1`) does not match the number of morph targets (`%2`).|Error|
|MESH_PRIMITIVES_UNEQUAL_JOINTS_COUNT|All primitives should contain the same number of 'JOINTS' and 'WEIGHTS' attribute sets.|Warning|
|MESH_PRIMITIVES_UNEQUAL_TARGETS_COUNT|All primitives must have the same number of morph targets.|Error|
|MESH_PRIMITIVE_INDEXED_SEMANTIC_CONTINUITY|Indices for indexed attribute semantic '`%1`' must start with 0 and be continuous.|Error|
|MESH_PRIMITIVE_INVALID_ATTRIBUTE|Invalid attribute name '`%1`'.|Error|
|MESH_PRIMITIVE_JOINTS_WEIGHTS_MISMATCH|Number of JOINTS attribute semantics must match number of WEIGHTS.|Error|
|MESH_PRIMITIVE_NO_POSITION|No POSITION attribute found.|Warning|
|MESH_PRIMITIVE_TANGENT_POINTS|TANGENT attribute defined for POINTS rendering mode.|Warning|
|MESH_PRIMITIVE_TANGENT_WITHOUT_NORMAL|TANGENT attribute without NORMAL found.|Warning|
|MULTIPLE_EXTENSIONS|Multiple extensions are defined for this object: ('`%a`', '`%b`', '`%c`').|Warning|
|NODE_EMPTY|Empty node encountered.|Information|
|NODE_MATRIX_DEFAULT|Do not specify default transform matrix.|Information|
|NODE_MATRIX_NON_TRS|Matrix must be decomposable to TRS.|Error|
|NODE_MATRIX_TRS|A node can have either a matrix or any combination of translation/rotation/scale (TRS) properties.|Error|
|NODE_ROTATION_NON_UNIT|Rotation quaternion must be normalized.|Error|
|NON_RELATIVE_URI|Non-relative URI found: `%1`.|Warning|
|UNKNOWN_ASSET_MAJOR_VERSION|Unknown glTF major asset version: `%1`.|Error|
|UNKNOWN_ASSET_MINOR_VERSION|Unknown glTF minor asset version: `%1`.|Warning|
|UNRESERVED_EXTENSION_PREFIX|Extension uses unreserved extension prefix '`%1`'.|Warning|
|UNUSED_EXTENSION_REQUIRED|Unused extension '`%1`' cannot be required.|Error|
## LinkError
| Code | Message | Severity |
|------|---------|----------|
|ACCESSOR_SMALL_BYTESTRIDE|Referenced bufferView's byteStride value `%1` is less than accessor element's length `%2`.|Error|
|ACCESSOR_TOO_LONG|Accessor (offset: `%1`, length: `%2`) does not fit referenced bufferView [`%3`] length `%4`.|Error|
|ACCESSOR_TOTAL_OFFSET_ALIGNMENT|Accessor's total byteOffset `%1` isn't a multiple of componentType length `%2`.|Error|
|ACCESSOR_USAGE_OVERRIDE|Override of previously set accessor usage. Initial: '`%1`', new: '`%2`'.|Error|
|ANIMATION_CHANNEL_TARGET_NODE_MATRIX|Animation channel cannot target TRS properties of node with defined matrix.|Error|
|ANIMATION_CHANNEL_TARGET_NODE_WEIGHTS_NO_MORPHS|Animation channel cannot target WEIGHTS when mesh does not have morph targets.|Error|
|ANIMATION_DUPLICATE_TARGETS|Animation channel has the same target as channel `%1`.|Error|
|ANIMATION_SAMPLER_INPUT_ACCESSOR_INVALID_FORMAT|Invalid Animation sampler input accessor format '`%1`'. Must be one of ('`%a`', '`%b`', '`%c`').|Error|
|ANIMATION_SAMPLER_INPUT_ACCESSOR_TOO_FEW_ELEMENTS|Animation sampler output accessor with '`%1`' interpolation must have at least `%2` elements. Got `%3`.|Error|
|ANIMATION_SAMPLER_INPUT_ACCESSOR_WITHOUT_BOUNDS|accessor.min and accessor.max must be defined for animation input accessor.|Error|
|ANIMATION_SAMPLER_OUTPUT_ACCESSOR_INVALID_COUNT|Animation sampler output accessor of count `%1` expected. Found `%2`.|Error|
|ANIMATION_SAMPLER_OUTPUT_ACCESSOR_INVALID_FORMAT|Invalid animation sampler output accessor format '`%1`' for path '`%3`'. Must be one of ('`%a`', '`%b`', '`%c`').|Error|
|ANIMATION_SAMPLER_OUTPUT_INTERPOLATION|The same output accessor cannot be used both for spline and linear data.|Error|
|BUFFER_MISSING_GLB_DATA|Buffer refers to an unresolved GLB binary chunk.|Error|
|BUFFER_NON_FIRST_GLB|Buffer referring to GLB binary chunk must be the first.|Error|
|BUFFER_VIEW_TARGET_OVERRIDE|Override of previously set bufferView target or usage. Initial: '`%1`', new: '`%2`'.|Error|
|BUFFER_VIEW_TOO_LONG|BufferView does not fit buffer (`%1`) byteLength (`%2`).|Error|
|INVALID_IBM_ACCESSOR_COUNT|Accessor of count `%1` expected. Found `%2`.|Error|
|MESH_PRIMITIVE_ACCESSOR_UNALIGNED|Vertex attribute data must be aligned to 4-byte boundaries.|Error|
|MESH_PRIMITIVE_ACCESSOR_WITHOUT_BYTESTRIDE|bufferView.byteStride must be defined when two or more accessors use the same buffer view.|Error|
|MESH_PRIMITIVE_ATTRIBUTES_ACCESSOR_INVALID_FORMAT|Invalid accessor format '`%1`' for this attribute semantic. Must be one of ('`%a`', '`%b`', '`%c`').|Error|
|MESH_PRIMITIVE_INCOMPATIBLE_MODE|Number of vertices or indices (`%1`) is not compatible with used drawing mode ('`%2`').|Warning|
|MESH_PRIMITIVE_INDICES_ACCESSOR_INVALID_FORMAT|Invalid indices accessor format '`%1`'. Must be one of ('`%a`', '`%b`', '`%c`'). |Error|
|MESH_PRIMITIVE_INDICES_ACCESSOR_WITH_BYTESTRIDE|bufferView.byteStride must not be defined for indices accessor.|Error|
|MESH_PRIMITIVE_MORPH_TARGET_INVALID_ATTRIBUTE_COUNT|Base accessor has different count.|Error|
|MESH_PRIMITIVE_MORPH_TARGET_NO_BASE_ACCESSOR|No base accessor for this attribute semantic.|Error|
|MESH_PRIMITIVE_POSITION_ACCESSOR_WITHOUT_BOUNDS|accessor.min and accessor.max must be defined for POSITION attribute accessor.|Error|
|MESH_PRIMITIVE_TOO_FEW_TEXCOORDS|Material is incompatible with mesh primitive: Texture binding '`%1`' needs 'TEXCOORD_`%2`' attribute.|Error|
|MESH_PRIMITIVE_UNEQUAL_ACCESSOR_COUNT|All accessors of the same primitive must have the same count.|Error|
|MESH_PRIMITIVE_UNUSED_TEXCOORD|Material does not use texture coordinates sets with indices ('`%a`', '`%b`', '`%c`').|Information|
|NODE_LOOP|Node is a part of a node loop.|Error|
|NODE_PARENT_OVERRIDE|Value overrides parent of node `%1`.|Error|
|NODE_SKINNED_MESH_WITHOUT_SKIN|Node uses skinned mesh, but has no skin defined.|Warning|
|NODE_SKIN_WITH_NON_SKINNED_MESH|Node has skin defined, but mesh has no joints data.|Error|
|NODE_WEIGHTS_INVALID|The length of weights array (`%1`) does not match the number of morph targets (`%2`).|Error|
|SCENE_NON_ROOT_NODE|Node `%1` is not a root node.|Error|
|SKIN_IBM_INVALID_FORMAT|Invalid IBM accessor format '`%1`'. Must be one of ('`%a`', '`%b`', '`%c`'). |Error|
|UNDECLARED_EXTENSION|Extension was not declared in extensionsUsed.|Error|
|UNEXPECTED_EXTENSION_OBJECT|Unexpected location for this extension.|Error|
|UNRESOLVED_REFERENCE|Unresolved reference: `%1`.|Error|
|UNSUPPORTED_EXTENSION|Unsupported extension encountered: '`%1`'.|Warning|
|UNUSED_OBJECT|This object may be unused.|Information|
## DataError
| Code | Message | Severity |
|------|---------|----------|
|ACCESSOR_ANIMATION_INPUT_NEGATIVE|Animation input accessor element at index `%1` is negative: `%2`.|Error|
|ACCESSOR_ANIMATION_INPUT_NON_INCREASING|Animation input accessor element at index `%1` is less than or equal to previous: `%2` <= `%3`.|Error|
|ACCESSOR_ELEMENT_OUT_OF_MAX_BOUND|Accessor contains `%1` element(s) greater than declared maximum value `%2`.|Error|
|ACCESSOR_ELEMENT_OUT_OF_MIN_BOUND|Accessor contains `%1` element(s) less than declared minimum value `%2`.|Error|
|ACCESSOR_INDECOMPOSABLE_MATRIX|Matrix element at index `%1` is not decomposable to TRS.|Error|
|ACCESSOR_INDEX_OOB|Indices accessor element at index `%1` has vertex index `%2` that exceeds number of available vertices `%3`.|Error|
|ACCESSOR_INDEX_TRIANGLE_DEGENERATE|Indices accessor contains `%1` degenerate triangles.|Information|
|ACCESSOR_INVALID_FLOAT|Accessor element at index `%1` is NaN or Infinity.|Error|
|ACCESSOR_INVALID_SIGN|Accessor element at index `%1` has invalid w component: `%2`. Must be 1.0 or -1.0.|Error|
|ACCESSOR_MAX_MISMATCH|Declared maximum value for this component (`%1`) does not match actual maximum (`%2`).|Error|
|ACCESSOR_MIN_MISMATCH|Declared minimum value for this component (`%1`) does not match actual minimum (`%2`).|Error|
|ACCESSOR_NON_UNIT|Accessor element at index `%1` is not of unit length: `%2`.|Error|
|ACCESSOR_SPARSE_INDEX_OOB|Accessor sparse indices element at index `%1` is greater than or equal to the number of accessor elements: `%2` >= `%3`.|Error|
|ACCESSOR_SPARSE_INDICES_NON_INCREASING|Accessor sparse indices element at index `%1` is less than or equal to previous: `%2` <= `%3`.|Error|
|BUFFER_EMBEDDED_BYTELENGTH_MISMATCH|Actual data length `%1` is not equal to the declared buffer byteLength `%2`.|Error|
|BUFFER_EXTERNAL_BYTELENGTH_MISMATCH|Actual data length `%1` is less than the declared buffer byteLength `%2`.|Error|
|BUFFER_GLB_CHUNK_TOO_BIG|GLB-stored BIN chunk contains `%1` extra padding byte(s).|Warning|
|IMAGE_DATA_INVALID|Image data is invalid. `%1`|Error|
|IMAGE_MIME_TYPE_INVALID|Recognized image format '`%1`' does not match declared image format '`%2`'.|Error|
|IMAGE_NPOT_DIMENSIONS|Image has non-power-of-two dimensions: `%1`x`%2`.|Information|
|IMAGE_UNEXPECTED_EOS|Unexpected end of image stream.|Error|
|IMAGE_UNRECOGNIZED_FORMAT|Image format not recognized.|Warning|
## GlbError
| Code | Message | Severity |
|------|---------|----------|
|GLB_CHUNK_LENGTH_UNALIGNED|Length of `%1` chunk is not aligned to 4-byte boundaries.|Error|
|GLB_CHUNK_TOO_BIG|Chunk (`%1`) length (`%2`) does not fit total GLB length.|Error|
|GLB_DUPLICATE_CHUNK|Chunk of type `%1` has already been used.|Error|
|GLB_EMPTY_CHUNK|Chunk (`%1`) cannot have zero length.|Error|
|GLB_INVALID_MAGIC|Invalid GLB magic value (`%1`).|Error|
|GLB_INVALID_VERSION|Invalid GLB version value `%1`.|Error|
|GLB_LENGTH_MISMATCH|Declared length (`%1`) does not match GLB length (`%2`).|Error|
|GLB_LENGTH_TOO_SMALL|Declared GLB length (`%1`) is too small.|Error|
|GLB_UNEXPECTED_BIN_CHUNK|BIN chunk must be the second chunk.|Error|
|GLB_UNEXPECTED_END_OF_CHUNK_DATA|Unexpected end of chunk data.|Error|
|GLB_UNEXPECTED_END_OF_CHUNK_HEADER|Unexpected end of chunk header.|Error|
|GLB_UNEXPECTED_END_OF_HEADER|Unexpected end of header.|Error|
|GLB_UNEXPECTED_FIRST_CHUNK|First chunk must be of JSON type. Found `%1` instead.|Error|
|GLB_UNKNOWN_CHUNK_TYPE|Unknown GLB chunk type: `%1`.|Warning|