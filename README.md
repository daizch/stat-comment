# stat-comment
A little tool to extract comments based on [acorn](https://github.com/ternjs/acorn) and [uglify-js](https://github.com/mishoo/UglifyJS2).

[![NPM version](https://img.shields.io/npm/v/stat-comment.svg?style=flat)](https://www.npmjs.com/package/stat-comment)
[![Build Status](https://secure.travis-ci.org/daizch/stat-comment.svg?branch=master)](http://travis-ci.org/daizch/stat-comment)

## Usage

Firstly, install `stat-comment` as a development dependency:

```shell
npm install stat-comment --save-dev
```

```javascript
//input.js
stat('auto.click.stat', 'click'); //Iamcomment

function stat(a, b) {

}

stat('tap'); /*tap event*/
```

```javascript
const Stat = require('stat-comment');
const fs = require('fs');
const code = fs.readFileSync('./input.js');
Stat.parse(code);
Stat.exportReport();
```

`open output/report.html` to see the result.

## method
- `parse`: parse the code to get the comments and arguments
- `parseComments`: get the comments
- `exportReport`: export the default report of the result
- `output`: output the parsed result into file

## License

[MIT License](http://en.wikipedia.org/wiki/MIT_License)