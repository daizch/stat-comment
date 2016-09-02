const UglifyJS = require('uglify-js');
const acorn = require('acorn');
const fs = require('fs');
const path = require('path');


const dirname = __dirname;
const CWD = process.cwd();

/**
 *
 * @param options
 * @param options.reportPath
 * @returns {StatComment}
 * @constructor
 */
function StatComment(options) {
    if (!(this instanceof StatComment)) {
        return new StatComment(options);
    }
    options = options || {};
    this.options = options;
    this.keyMethod = options.keyMethod || 'stat';
}

StatComment.prototype.parse = function (code, filepath) {
    var self = this;
    var comments = self.parseComments(code);
    var ast = UglifyJS.parse(code);
    var nodes = [];

    this.filepath = filepath || 'N/A';
    ast.walk(new UglifyJS.TreeWalker(function (node) {
        if (node instanceof UglifyJS.AST_Call
            && node.expression.print_to_string() === self.keyMethod
            && node.args.length) {

            var comment = comments[node.expression.start.line];
            var result = {
                // node: node,
                args: [],
                comment: (comment && comment.value) || 'N/A',
                line: node.expression.start.line
            }
            result.args = node.args.map(function (arg) {
                return arg.value;
            });
            result.name = result.args[0];
            nodes.push(result);
        }
    }));
    this.nodes = nodes;
    return nodes;
};

StatComment.prototype.parseComments = function parseComments(code) {
    var comments = [];
    var ast = acorn.parse(code, {
        locations: true,
        ranges: true,
        onComment: comments
    });

    var result = {};
    comments.forEach(function (comment) {
        result[comment.loc.start.line] = comment;
        return comment;
    })
    return result;
};

StatComment.prototype.exportReport = function (nodes) {
    var output = '';
    nodes = nodes || this.nodes;
    var reportPath = this.options.reportPath || path.join(CWD, 'output/report.html');
    var tpl = fs.readFileSync(path.join(dirname, 'lib/report.tpl')).toString();

    var filepath = this.filepath || '';
    nodes.forEach(function (node, i) {
        output += `<tr><th>${i + 1}</th><td>${node.name}</td><td>${node.comment}</td><td>file: ${filepath}<br/>line: ${node.line}</td></tr>`;
    });

    output = tpl.replace('<!--content-->', output);
    fs.writeFileSync(reportPath, output);
};

StatComment.prototype.output = function (filepath) {
    filepath = filepath || path.join(dirname, 'output.json');
    var writeStream = fs.createWriteStream(filepath);
    writeStream.write(JSON.stringify(this.nodes, null, 4));
    writeStream.close();
};

module.exports = StatComment;
