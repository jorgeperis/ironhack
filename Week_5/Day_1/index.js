$(document).ready( function(){
  var phrases = ['I like pizza','I like mountain bike','I like beers'];
  $('body').prepend('<p>');
  $('p').text(phrases[Math.floor(Math.random()*phrases.length)]);
  $('a').text("Hide elements");

  function showPhrases(){
    for(var i = 0;i<phrases.length;i++){
      var list = $('<li>');
      list.addClass("list" + i)
      if ($('p').text() == phrases[i]){
        var bold = $('<b>')
        bold.text(phrases[i]);
        list.append(bold);
      } else {
        list.text(phrases[i]);
      }
      $('ul').append(list);
      var image = $('<img src="remove.png" alt="remove"/>')
      image.addClass('img' + i);
      list.append(image);
    }
  }

  function random(paragraph){
    var rand = Math.floor(Math.random()*phrases.length);
    if (paragraph.text() == phrases[rand]){
      return random(paragraph);
    } else {
      return rand
    }
  }

  showPhrases();

  $('form').submit( function(){
    var paragraph = $('p');
    paragraph.text(phrases[random(paragraph)]);
    $('li').remove();
    showPhrases();
  });

  $('.hideshow').click( function(e){
    e.preventDefault();
    $('ul').toggle();
    if ($(this).text() == "Show elements") {
      $(this).text("Hide elements");
    } else {
      $(this).text("Show elements");
    }
  })

  $(document).on('click','img', function(e){
      var txt = $($(this).parent()[0]).text();
      var index = phrases.indexOf(txt);
      if (index > -1) {
        phrases.splice(index, 1);
      }
      $("li").remove();
      showPhrases();
  });

  $('.add').submit( function(e){
    e.preventDefault();

    if ($('.inputphrase').val() != "") {
      phrases.push($('.inputphrase').val());
      $('.inputphrase').val("");
      $('li').remove();
      showPhrases();
    }
  });
});
