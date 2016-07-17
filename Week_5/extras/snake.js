$(document).ready(function() {

    function createGrid() {
        for (var i = 0; i < 15; i++) {
            for (var j = 0; j < 15; j++) {
                var div = $('<div>');
                div.attr('data-row', i).attr('data-col', j).addClass('blue');
                $('.container').append(div);
            }
        }
    }

    createGrid();

    $('.container').on('click', 'div', function() {
        var firstCol = parseInt($(this).attr('data-col'));
        var firstRow = parseInt($(this).attr('data-row'));
        $(this).toggleClass('blue red').attr('id',0);
        [1,2,3,4].forEach(function(i) {
          var newCol = firstCol + i;
          var newCell = $('[data-row="' + firstRow + '"][data-col="' + newCol + '"]').get(0);
          $(newCell).toggleClass('blue orange').attr('id',i);
        });
        $(document).on('keydown', function(e) {

          $('[id="4"]').toggleClass('orange blue').removeAttr('id');
          $('[id="3"]').attr('id',4);
          $('[id="2"]').attr('id',3);
          $('[id="1"]').attr('id',2);


          if (e.keyCode == 38){
            moveCell(-1,0);
          }else if (e.keyCode == 37){
            moveCell(0,-1);
          }else if (e.keyCode == 40){
            moveCell(1,0);
          }else if (e.keyCode == 39){
            moveCell(0,1);
          }
        });
    })

    function moveCell(moveRow,moveCol) {
      var col = parseInt($('.red').attr('data-col'));
      var row = parseInt($('.red').attr('data-row'));
      var newRow = row + moveRow;
      var newCol = col + moveCol;
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
      console.log(newRow);
      console.log(newCol);
      var newCell = $('[data-row="' + newRow + '"][data-col="' + newCol + '"]').get(0);
      $('[id="0"]').toggleClass('orange red').attr('id',1);
      $(newCell).toggleClass('blue red').attr('id',0);
    }

});
