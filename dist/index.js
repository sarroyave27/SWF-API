"use strict";

var _app = _interopRequireDefault(require("./app.js"));
var _config = require("./config.js");
function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }
_app["default"].listen(_config.PORT);
console.log("http://localhost:".concat(_config.PORT));