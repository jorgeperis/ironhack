(function () {
  if (typeof window.PokemonApp === 'undefined') {
    window.PokemonApp = {};
  }

  var PokemonView = PokemonApp.PokemonView = function (model) {
    this.model = model;
  };

  PokemonView.prototype.render = function () {
    $('.js-pokemon-name').text(this.model.name);
    $('.js-pokemon-id').text('#' + this.model.national_id);
    $('.js-pokemon-height').text(this.model.height);
    $('.js-pokemon-weight').text(this.model.weight);
    $('.js-pokemon-hp').text(this.model.hp);
    $('.js-pokemon-speed').text(this.model.speed);
    $('.js-pokemon-sdefense').text(this.model.sp_def);
    $('.js-pokemon-sattack').text(this.model.sp_atk);
    $('.js-pokemon-defense').text(this.model.defense);
    $('.js-pokemon-attack').text(this.model.attack);
    $('.js-pokemon-image').attr('src',"https://pokeapi.co/" + this.model.image_url);

    (this.model.types_array).forEach( function(type,index){
      var types = $('<dt>').text(type.name).attr('uri',type.resource_uri).addClass('type');
      $('.types').append(types);
    })
    $('.modal').modal('show');
  }
})()

$(document).on('click','.type', function(){
  $('.modal').modal('hide');
  var type_url_call = $(this).attr('uri')
  $.ajax({
    url: type_url_call,
    success: function(result) {
      console.log("works!!");
      console.log(result);
    }
  })
  $('.modaltype').modal('show');

})
