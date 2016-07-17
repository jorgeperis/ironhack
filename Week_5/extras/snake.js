$(document).ready(function() {
  var length = 4;
  var time = 300;
  var left = [0,-1];
  var up = [-1,0];
  var right = [0,1];
  var down = [1,0];
  var move = left;

  function createGrid() {
      for (var i = 0; i < 15; i++) {
          for (var j = 0; j < 15; j++) {
              var div = $('<div>');
              div.attr('data-row', i).attr('data-col', j).addClass('blue');
              $('.container').append(div);
          }
      }
  }

  function keyPress(){
    var movement = setInterval(moveCells,time);
    $(document).on('keydown', function(e) {
      clearInterval(movement);
      if (e.keyCode == 38){
        move = up;
      }else if (e.keyCode == 37){
        move = left;
      }else if (e.keyCode == 40){
        move = down;
      }else if (e.keyCode == 39){
        move = right;
      }
      movement = setInterval(moveCells,time);
    });
  }

  function start() {
    for (var i = 0; i<=length;i++){
      if (i == 0){
        var color = "red";
      } else {
        var color = "orange";
      }
      var head = $('[data-row="10"][data-col="' + (10+i) + '"]').get(0);
      $(head).toggleClass('blue ' + color).attr('id',i);
    }
    eat();
    keyPress();
  }

  var moveCells = function () {

    var col = parseInt($('.red').attr('data-col'));
    var row = parseInt($('.red').attr('data-row'));
    var newRow = row + move[0];
    var newCol = col + move[1];
    if (newRow == 15) {
      newRow = 0;
    } else if (newRow == -1){
      newRow = 14;
    }
    if (newCol == 15) {
      newCol = 0;
    } else if (newCol == -1){
      newCol = 14;
    }

    var firstCell = $('[data-row="' + newRow + '"][data-col="' + newCol + '"]').get(0);

    if ($(firstCell).hasClass('yellow')) {
      length ++;
      time = time - 5;
      eat();
    }
    if ($(firstCell).hasClass('orange')) {
      $('.js-modal').modal("show");
      setTimeout(function(){  location.reload(true); }, 2000);
    }
    for(var i = length;i>=0;i--) {
      if (i == length){
        $('[id="' + i + '"]').toggleClass('orange blue').removeAttr('id');
      } else if (i == 0){
        $('[id="' + i + '"]').attr('id',(i+1)).toggleClass('red orange');
        $(firstCell).toggleClass('blue red').attr('id',0);
      } else {
        $('[id="' + i + '"]').attr('id',(i+1));
      }
    }
  }

  function eat (){
    $('.yellow').removeClass('yellow');
    var blues = $('.blue');
    var randomEat = Math.floor(Math.random() * (blues.length-1));
    $(blues[randomEat]).addClass('yellow');
  }

  createGrid();
  start();
});
