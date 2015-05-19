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
      return (
        <div>
          {this.buttons()}
          <ul>{this.shows()}</ul>
        </div>
      );
    },

    componentDidMount: function () {
      $.ajax({
        type: "get",
        url: "/api/tv_shows",
        dataType: "json",
        success: function (data) {
          this.setState({ shows: data });
        }.bind(this)
      });
    },

    buttons: function () {
      return this.categories.map(function (category, i) {
        return (
          <FetchTv
            category={category}
            addShows={this.addShows}
            key={"category-" + i} />
        );
      }.bind(this));
    },

    addShows: function (shows) {
      this.setState({
        shows: this.state.shows.concat(shows)
      });
    },

    shows: function () {
      return this.state.shows.map(function (show) {
        return (<TvShow show={show} key={show.id} />);
      });
    }
  });
})(this);
