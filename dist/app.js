"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;
var _express = _interopRequireDefault(require("express"));
var _usersRoutes = _interopRequireDefault(require("./routes/users.routes.js"));
var _planRoutes = _interopRequireDefault(require("./routes/plan.routes.js"));
var _recipeRoutes = _interopRequireDefault(require("./routes/recipe.routes.js"));
function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }
var app = (0, _express["default"])();
app.set("PORT", process.env.PORT || 3000);
app.use(_express["default"].json());
app.use("/api", _usersRoutes["default"]);
app.use("/plan", _planRoutes["default"]);
app.use("/recipes", _recipeRoutes["default"]);
app.use(function (req, res) {
  res.status(200).json({
    message: "Bienvenido al BackEnd de StreetWiseFitness"
  });
});
var _default = app;
exports["default"] = _default;