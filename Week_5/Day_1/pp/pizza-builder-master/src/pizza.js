// Write your Pizza Builder JavaScript in this file.
$(document).ready(function(){
  var base = 10;
  var pepperoniPrice = 1;
  var mushroomPrice = 1;
  var greenPeppersPrice = 1;
  var whiteSaucePrice = 3;
  var glutenFreePrice = 5;
  var total = 0;
  /*
  <li class="list-pepperoni">$1 pepperonni</li>
  <li class="list-mushrooms">$1 mushrooms</li>
  <li class="list-peppers">$1 green peppers</liclass>
  <li class="list-sauce">$3 white sauce</li>
  <li class="list-crust">$5 gluten-free crust</li>*/
  function updatePrice(){
    total = 0;
    $('.btn').each(function(){
      if($(this).hasClass('active')){
        total += parseInt($(this).attr("data-price"));
      }
    })
    $('strong').html("$" + (total + base));
  }
  $('.btn-pepperonni').click(function(){
      $('.pep').toggleClass('hidden');
      $(this).toggleClass('active');
      $('.list-pepperoni').toggleClass('hidden');
      updatePrice();
  });
  $('.btn-mushrooms').click(function(){
      $('.mushroom').toggleClass('hidden');
      $(this).toggleClass('active');
      $('.list-mushrooms').toggleClass('hidden');
      updatePrice();
  });
  $('.btn-green-peppers').click(function(){
      $('.green-pepper').toggleClass('hidden');
      $(this).toggleClass('active');
      $('.list-peppers').toggleClass('hidden');

      updatePrice();
  });
  $('.btn-sauce').click(function(){
      $('.sauce').toggleClass('sauce-white');
      $(this).toggleClass('active');
      $('.list-sauce').toggleClass('hidden');

      updatePrice();
  });
  $('.btn-crust').click(function(){
    $('.crust').toggleClass('crust-gluten-free');
    $(this).toggleClass('active');
    $('.list-crust').toggleClass('hidden');

    updatePrice();
  });

});
