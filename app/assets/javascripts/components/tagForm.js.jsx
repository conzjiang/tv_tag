(function (root) {
  var TvTag = root.TvTag = root.TvTag || {};
  var isEnterKey = TvTag.Utils.isEnterKey;

  var TagForm = TvTag.TagForm = React.createClass({
    propTypes: {},

    getInitialState: function () {
      return { open: false, tags: [] };
    },

    componentDidMount: function () {
      this.setState({ tags: this.props.show.tags });
      delete this.props.show.tags;
    },

    render: function () {
      var button;
      var tags = this.state.tags.map(function (tag) {
        var key = this.props.show.id + "-" + tag.id;
        return <li key={key}>{tag.name}</li>;
      }.bind(this));

      if (this.state.open) {
        button = (
          <div>
            <input
              ref="input"
              type="text"
              onKeyUp={this.addTag}
              onBlur={this.close} />
            <button onClick={this.close}>Done</button>
          </div>
        );
      } else {
        button = (<button onClick={this.open}>Add Tags</button>);
      }

      return (
        <div>
          <ul>{tags}</ul>
          {button}
        </div>
      );
    },

    open: function () {
      this.setState({ open: true }, function () {
        React.findDOMNode(this.refs.input).focus();
      }.bind(this));
    },

    close: function () {
      var tagIds = this.state.tags.map(function (tag) {
        return tag.id;
      });

      $.ajax({
        type: "put",
        url: "/api/tv_shows/" + this.props.show.id,
        data: { tv_show: { tag_ids: tagIds } },
        dataType: "json"
      });

      this.setState({ open: false });
    },

    addTag: function (e) {
      if (!isEnterKey(e)) { return; }

      $.ajax({
        type: "post",
        url: "/api/tags",
        data: { tag: { name: e.currentTarget.value } },
        dataType: "json",
        success: function (data) {
          var tags = this.state.tags;
          tags.push(data);
          this.setState({ tags: tags });
          React.findDOMNode(this.refs.input).value = "";
        }.bind(this)
      });
    }
  });

})(this);