//= require ./components/fetchTv
//= require ./components/tvShow
//= require_tree ./components

$(document).ready(function () {
  var App = TvTag.App;
  React.render(<App />, document.getElementById("actions"));
});
