const fs = require('fs');
const StatComment = require('..');

var stat = new StatComment();
var code = fs.readFileSync('./test/ast.js');
code = code.toString();

var nodes = stat.parse(code, 'test/ast.js');
nodes.forEach(function (node) {
    console.log(node.comment)
    console.log(node.args)
});

stat.exportReport();

