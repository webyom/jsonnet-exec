(function() {
  var _exec, child_process, jsonnetBinFilePath, path;

  path = require('path');

  child_process = require('child_process');

  jsonnetBinFilePath = path.resolve(__filename, '../../bin/jsonnet');

  _exec = function(args, sync) {
    args = Array.prototype.slice.call(args);
    if (typeof args[0] === 'string') {
      args[0] = jsonnetBinFilePath + " " + args[0];
    }
    if (sync) {
      return child_process.execSync.apply(child_process, args);
    } else {
      return child_process.exec.apply(child_process, args);
    }
  };

  module.exports = {
    exec: function() {
      return _exec(arguments);
    },
    execSync: function() {
      return _exec(arguments, true);
    }
  };

}).call(this);
