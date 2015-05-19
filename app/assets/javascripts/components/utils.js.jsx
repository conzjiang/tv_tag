(function (root) {
  var TvTag = root.TvTag = root.TvTag || {};

  TvTag.createClass = function (options) {
    return React.createClass($.extend({
      mixins: [React.addons.PureRenderMixin]
    }, options));
  };
})(this);