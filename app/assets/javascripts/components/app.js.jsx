(function (root) {
  var TvTag = root.TvTag = root.TvTag || {};
  var FetchTv = TvTag.FetchTv;
  var TvShow = TvTag.TvShow;

  var App = TvTag.App = React.createClass({
    getInitialState: function () {
      return { shows: [] };
    },

    componentWillMount: function () {
      this.categories = JSON.parse($("#categories").html());
    },

    render: function () {
      var buttons = this.categories.map(function (category, i) {
        return (
          <FetchTv
            category={category}
            addShows={this.addShows}
            key={"category-" + i} />
        );
      }.bind(this));

      var shows = this.state.shows.map(function (show) {
        return (<TvShow show={show} key={show.id} />);
      });

      return (
        <div>
          {buttons}
          <ul>{shows}</ul>
        </div>
      );
    },

    addShows: function (shows) {
      this.setState({
        shows: this.state.shows.concat(shows)
      });
    }
  });
})(this);