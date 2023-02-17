;; extends
"export" @keyword.export
"import" @keyword.import

[
 (undefined)
 (null)
 (false)
] @constant.falsy

(import_clause 
  [
    (identifier) @import.identifier
    (named_imports (import_specifier 
      [
        name: (identifier) @import.identifier
        alias: (identifier) @import.identifier
      ]
    ))
    (namespace_import (identifier) @import.identifier)
  ]
)
