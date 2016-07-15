$(function () {
  var myTrackArtistId;
  var myResult;
  var arrayPosition = 0;
  var myArtist;

  var SpotifySearch = function(e){
    e.preventDefault();
    searchView();
    searchModel();
  };

  function searchView(){
    $('[name="more-results"]').prop('disabled',false);
    $('.btn-play').removeClass('playing');
    $('.btn-play').addClass('disabled');
  }
  function searchModel(){
    var track = $('[name="track"]').val();
    $.ajax({
      url: 'https://api.spotify.com/v1/search?type=track&query=' + track,
      success: showPlayerResults
    })
  }

  var showPlayerResults = function(result){
    myResult = result;
    var myTrackResult = myResult.tracks.items[arrayPosition];
    var myTrackName = myTrackResult.name;
    var myTrackArtist = myTrackResult.artists[0].name;
    myTrackArtistId = myTrackResult.artists[0].id;
    var myTrackCover = myTrackResult.album.images[1].url;
    var myTrackSong = myTrackResult.preview_url;

    $('.title').text(myTrackName);
    $('.author').text(myTrackArtist);
    $('.cover img').attr('src',myTrackCover);
    $('.js-player').attr('src',myTrackSong);
    $('.btn-play').removeClass('disabled');
  }

  var SpotifyPlayer = function(){
    if ($(this).hasClass('playing')) {
      $('.js-player').trigger('pause');
      $('.btn-play').removeClass('playing');
    } else {
      $('.js-player').trigger('play');
      $('.btn-play').addClass('playing');
    }
  }

  var SpotifyArtist = function(){
    $.ajax({
      url: 'https://api.spotify.com/v1/artists/' + myTrackArtistId,
      success: function(artist){
        myArtist = artist;
        $('.js-artist-name').text(artist.name);
        $('.js-artist-image').attr('src',artist.images[1].url);
        $('.js-artist-followers').text(artist.followers.total);
        $('.js-artist-popularity').text(artist.popularity);
        $('[name="see-albums"]').val("See " + artist.name + " albums");
      }
    })
    $('.js-modal').modal("show");
  }

  var SpotifyMoreResults = function(){
    $('.list-more-results').empty();
    $('.js-track-name').text($('[name="track"]').val());
    var ulMoreResults = $('.list-more-results');
    myResult.tracks.items.forEach( function(track,index){
      var liTrackName = $('<li>').text(track.name).addClass('more-results-track').attr('id',index);
      ulMoreResults.append(liTrackName);
    })
    $('.js-more-results').modal('show');
  }

  var SpotifySelectedTrack = function(){
    arrayPosition = parseInt($(this).attr('id'));
    showPlayerResults(myResult);
    $('.js-more-results').modal('hide');
    $('progress').val("0");
    $('.btn-play').removeClass('playing');
  }

  var SpotifySeeAlbums = function(){
    $('.list-artist-albums').empty();
    $('.js-artist-albums-name').text(myArtist.name);
    $('.js-modal').modal('hide');

    $.ajax({
      url: 'https://api.spotify.com/v1/artists/' + myArtist.id + '/albums',
      success: function(response){
        var albumsArray = response.items;
        albumsArray.forEach( function(album,i){
          $.ajax({
            url: 'https://api.spotify.com/v1/albums/' + album.id,
            success: function(albumInfo){
              var releasedDate = albumInfo.release_date;
              var textRelease = $('<span>').text('Released: ').addClass('albumReleased')
              var varRelease = $('<span>').text(releasedDate);
              var paragraphTwo = $('<p>').append(textRelease).append(varRelease);
              var textName = $('<span>').text('Name: ').addClass('albumName')
              var varName = $('<span>').text(albumInfo.name);
              var paragraphOne = $('<p>').append(textName).append(varName);
              var coverAlbum = $('<img>').attr('src',albumInfo.images[2].url)
              var li = $('<li>').append(paragraphOne).append(paragraphTwo).append(coverAlbum)
              $('.list-artist-albums').append(li);
              if (i == (albumsArray.length - 1)) {
                $('.js-artist-albums').modal('show');
              }
            }
          })
        })
      }
    })
  }

  function printTime () {
    var current = $('.js-player').prop('currentTime');
    $('progress').val(current);
  }

  $('.js-player').on('timeupdate', printTime);

  $('.search-form').on('submit', SpotifySearch);
  $('.btn-play').on('click', SpotifyPlayer);
  $('.author').on('click', SpotifyArtist);
  $('[name="more-results"]').on('click', SpotifyMoreResults);
  $(document).on('click','.more-results-track', SpotifySelectedTrack);
  $('[name="see-albums"]').on('click', SpotifySeeAlbums);

})
