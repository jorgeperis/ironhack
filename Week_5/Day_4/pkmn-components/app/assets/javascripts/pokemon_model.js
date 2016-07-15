(function () {
  window.PokemonApp = window.PokemonApp || {};

  var PokemonModel = PokemonApp.PokemonModel = function (url) {
    this.url = url
  }

  PokemonModel.prototype.fetch = function (anything) {
    // 'anything' is the function passed when fetch is called: 'view.render'
    // the function will be called -funcion style- on success
    var model = this;
    $.ajax({
      url: this.url,
      success: function (pokemonData) {
        console.log(pokemonData);
        model.name = pokemonData.name;
        model.national_id = pokemonData.national_id;
        model.height = pokemonData.height;
        model.weight = pokemonData.weight;
        model.speed = pokemonData.speed;
        model.hp = pokemonData.hp;
        model.attack = pokemonData.attack;
        model.defense = pokemonData.defense;
        model.sp_atk = pokemonData.sp_atk;
        model.sp_def = pokemonData.sp_def;
        model.image_url_call = pokemonData.sprites[0].resource_uri;
        model.types_array = pokemonData.types;
        
        $.ajax({
          url: model.image_url_call,
          success: function(result) {
            console.log("image");
            model.image_url = result.image;
            anything();
          }
        })
      },
      error: function () {
        console.log('in da error');
      }
    })
  }
})()
