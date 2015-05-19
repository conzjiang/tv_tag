(function (root) {
  var TvTag = root.TvTag = root.TvTag || {};
  var TagForm = TvTag.TagForm;

  var TvShow = TvTag.TvShow = React.createClass({
    propTypes: {
      show: React.PropTypes.object
    },

    render: function () {
      return (
        <li>
          {this.props.show.title}
          <TagForm show={this.props.show} addTag={this.addTag} />
        </li>
      );
    }
  });

})(this);