const UglifyJS = require('uglify-js');
const acorn = require('acorn');
const fs = require('fs-extra');
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
    this.options.reportPath = options.reportPath || path.join(CWD, 'output/report.html');

}

StatComment.prototype.parse = function (code, filepath) {
    var self = this;
    var comments = self.parseComments(code);
    var ast = UglifyJS.parse(code);
    var nodes = [];

    ast.walk(new UglifyJS.TreeWalker(function (node) {
        if (node instanceof UglifyJS.AST_Call
            && node.expression.print_to_string() === self.keyMethod
            && node.args.length) {

            var comment = comments[node.expression.start.line];
            var result = {
                // node: node,
                args: [],
                comment: (comment && comment.value) || 'N/A',
                line: node.expression.start.line,
                filepath: filepath || 'N/A'
            }
            result.args = node.args.map(function (arg) {
                if (arg.value) {
                    return arg.value;
                }

                if (arg.left) {
                    return arg.left.value + (arg.right ? ('_' + arg.right.print_to_string()) : '');
                }
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
    var reportPath = this.options.reportPath;
    var tpl = fs.readFileSync(path.join(dirname, 'lib/report.tpl')).toString();

    nodes.forEach(function (node, i) {
        output += `<tr><th>${i + 1}</th><td>${node.args[0]}</td><td>${node.args[1] || ''}</td><td>${node.comment}</td><td>file: ${node.filepath}<br/>line: ${node.line}</td></tr>`;
    });

    output = tpl.replace('<!--content-->', output);
    fs.ensureFileSync(reportPath);
    fs.writeFileSync(reportPath, output);
};

StatComment.prototype.output = function (filepath) {
    filepath = filepath || path.join(dirname, 'output.json');
    var writeStream = fs.createWriteStream(filepath);
    writeStream.write(JSON.stringify(this.nodes, null, 4));
    writeStream.close();
};

module.exports = StatComment;
