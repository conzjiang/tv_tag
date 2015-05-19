(function (root) {
  var TvTag = root.TvTag = root.TvTag || {};

  var FetchTv = TvTag.FetchTv = React.createClass({
    render: function () {
      return <button onClick={this.fetch}>{this.props.category}</button>;
    },

    fetch: function (e) {
      e.preventDefault();

      $.ajax({
        type: "post",
        url: "/api/tv_shows",
        data: { category: this.props.category },
        dataType: "json",
        success: function (data) {
          this.props.addShows(data);
        }.bind(this)
      });
    }
  });

})(this);