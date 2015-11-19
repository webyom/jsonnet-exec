# jsonnet-exec
A nodejs child_process.exec and child_process.execSync wrapper for jsonnet cmdline tool

```javascript
var jsonnetExec = require('jsonnet-exec');

jsonnetExec.exec("/path/to/file.jsonnet", function(error, stdout, stderror) {
    if (!error) {
        console.log(stdout);
    }
});

var stdout = jsonnetExec.execSync("-e '{ x: 1 , y: self.x + 1 } { x: 10 }'");
console.log stdout.toString();
```
