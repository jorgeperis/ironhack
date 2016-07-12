$(document).ready( function(){

    var SpotifySearch = function(artists,albums,tracks,formElement){
      this.artists = artists;
      this.albums = albums;
      this.tracks = tracks;
      this.formElement = formElement;
      this.album = "";
      this.artist = "";
    }

    SpotifySearch.prototype.searchAlbums = function () {
      this.albums.empty();
      $.ajax({
        type: 'GET',
        url: 'https://api.spotify.com/v1/artists/' + this.artist + '/albums',
        success: this.successAlbum.bind(this),
        error: function (err) {
          console.log('in da error');
        }
      })
    }

    SpotifySearch.prototype.searchTracks = function () {
      this.tracks.empty();
      var that = this;
      $.ajax({
        type: 'GET',
        url: 'https://api.spotify.com/v1/albums/' + this.album + '/tracks',
        success: function (response) {
          response.items.forEach( function(element){
          var ptext = $('<p>').text(element.name);
          var alink = $('<a>').attr('href',element.preview_url).attr('target','_blank').append(ptext);
          that.tracks.append(alink);
         })
        },
        error: function (err) {
          console.log('in da error');
        }
      })
    }


    SpotifySearch.prototype.successArtist = function (response) {
      console.log('in da success');
      var that = this;
      response.artists.items.forEach( function(element){
        var ptext = $('<p>').text(element.name);
        var alink = $('<a>').attr('href',element.id).addClass("artist").append(ptext);
        if (element.images[1] != undefined) {
          var image = $('<img>').attr('src',element.images[1].url);
        }
        that.artists.append(alink);
        that.artists.append(image);
      })
    }

    SpotifySearch.prototype.successAlbum = function (response) {
      var that = this;
      response.items.forEach( function(element){
        var ptext = $('<p>').text(element.name);
        var alink = $('<a>').attr('href',element.id).addClass("album").append(ptext);
        if (element.images[1] != undefined) {
          var image = $('<img>').attr('src',element.images[1].url);
        }
        that.albums.append(alink);
        that.albums.append(image);
      })
    }

    SpotifySearch.prototype.searchArtists = function () {
      this.artists.empty();
      var artist = $('.artistsearch').val();
      $.ajax({
        type: 'GET',
        url: 'https://api.spotify.com/v1/search?type=artist&query=' + artist,
        success: this.successArtist.bind(this),
        error: function (err) {
          console.log('in da error');
        }
      })
    }


  var artists = $('.artists');
  var tracks = $('.tracks');
  var albums = $('.albums');
  var formElement = $('.search');

  var spotify = new SpotifySearch(artists,albums,tracks,formElement);

  formElement.on('submit', function(e) {
    e.preventDefault();
    spotify.searchArtists();
  });
  $(document).on('click','.artist', function(e) {
    e.preventDefault();
    spotify.artist = $(this).attr('href');
    spotify.searchAlbums();
  });
  $(document).on('click','.album', function(e) {
    e.preventDefault();
    spotify.album = $(this).attr('href');
    spotify.searchTracks();
  });
})
