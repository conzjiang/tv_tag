(function (root) {
  var TvTag = root.TvTag = root.TvTag || {};

  var TvShow = TvTag.TvShow = React.createClass({
    render: function () {
      return (
        <li>{this.props.show.title}</li>
      );
    }
  });

})(this);