//= require ./components/utils
//= require ./components/fetchTv
//= require ./components/tagForm
//= require ./components/tvShow
//= require_tree ./components

$(document).ready(function () {
  var App = TvTag.App;
  React.render(<App />, document.getElementById("main"));
});
