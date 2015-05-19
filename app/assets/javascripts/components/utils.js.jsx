(function (root) {
  var TvTag = root.TvTag = root.TvTag || {};
  var Utils = TvTag.Utils = {};

  TvTag.createClass = function (options) {
    return React.createClass($.extend({
      mixins: [React.addons.PureRenderMixin]
    }, options));
  };

  TvTag.Utils.isEnterKey = function (e) {
    return e.which === 13;
  };
})(this);