require('blanket')({
  // Only files that match the pattern will be instrumented
  pattern: 'controller-app/src'
});
require("coffee-script");
var libs = require('require-all')({
  dirname     :  __dirname + '/../src',
  filter      :  /(.+)\.coffee?$/,
  excludeDirs :  /^\.(git|svn)$/
});