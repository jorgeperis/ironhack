(function () {
  if (typeof window.PokemonApp === 'undefined') {
    window.PokemonApp = {};
  }

  var PokemonController = PokemonApp.PokemonController = function () {};

  function privateThing() {
    console.log('in da private');
  }

  PokemonController.prototype.onClick = function (e) {
    privateThing();
    var clickedEl = $(e.currentTarget);
    var url = clickedEl.data('pokemon-uri');
    var model = new PokemonApp.PokemonModel(url);
    var view = new PokemonApp.PokemonView(model);
    // Fetch is making an Ajax call which is asynch
    // we want to render, when the Ajax call has finished
    // we pass the function, we want to call on success
    model.fetch(view.render.bind(view));
  }

  PokemonController.prototype.setListeners = function () {
    $('.js-show-pokemon').on('click', this.onClick.bind(this))
  }

})()
