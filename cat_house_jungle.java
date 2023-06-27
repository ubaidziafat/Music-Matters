public class MusicMatters {

    public static void main(String[] args) {
    
        //create an album
        Album myAlbum = new Album("My Album");
 
        //create a list of songs
        List<Song> mySongs = new ArrayList<Song>();
        mySongs.add(new Song("Track 1"));
        mySongs.add(new Song("Track 2"));
        mySongs.add(new Song("Track 3"));
        mySongs.add(new Song("Track 4"));
        mySongs.add(new Song("Track 5"));
        
        //add songs to album
        myAlbum.addSongs(mySongs);
 
        //promote album
        myAlbum.promote();
 
        //create a list of artists
        List<Artist> myArtists = new ArrayList<Artist>();
        myArtists.add(new Artist("John Doe"));
        myArtists.add(new Artist("Jane Doe"));
        
        //add artists to album
        myAlbum.addArtists(myArtists);
 
        //print album details
        System.out.println(myAlbum);
 
        //create a playlist
        Playlist myPlaylist = new Playlist();
 
        //add songs to playlist
        myPlaylist.addSongs(mySongs);
 
        //print playlist contents
        System.out.println(myPlaylist);
        
        //create a radio station
        RadioStation myRadioStation = new RadioStation("My Radio Station");
 
        //add songs to radio station
        myRadioStation.addSongs(mySongs);
 
        //broadcast songs on radio station
        myRadioStation.broadcast();
 
        //print radio station details
        System.out.println(myRadioStation);
 
        //create a music store
        MusicStore myMusicStore = new MusicStore("My Music Store");
        
        //add album to store
        myMusicStore.addAlbum(myAlbum);
        
        //add songs to store
        myMusicStore.addSongs(mySongs);
 
        //sell album
        myMusicStore.sellAlbum(myAlbum);
        
        //sell songs
        myMusicStore.sellSongs(mySongs);
 
        //print store details
        System.out.println(myMusicStore);
 
        //create a fan
        Fan myFan = new Fan("John Smith");
 
        //add songs to fan favorites
        myFan.addFavorites(mySongs);
 
        //follow artists
        myFan.followArtists(myArtists);
        
        //buy album
        myFan.buyAlbum(myAlbum);
 
        //buy songs
        myFan.buySongs(mySongs);
 
        //print fan details
        System.out.println(myFan);
 
        //create a music label
        MusicLabel myLabel = new MusicLabel("My Music Label");
        
        //add album to label
        myLabel.addAlbum(myAlbum);
        
        //publish album
        myLabel.publishAlbum(myAlbum);
 
        //sign artists
        myLabel.signArtists(myArtists);
 
        //promote album
        myLabel.promoteAlbum(myAlbum);
        
        //print label details
        System.out.println(myLabel);
    }
}

class Album {
 
    private String title;
    private List<Song> songs;
    private List<Artist> artists;
 
    public Album(String title) {
        this.title = title;
        this.songs = new ArrayList<Song>();
        this.artists = new ArrayList<Artist>();
    }
 
    public void addSongs(List<Song> songs) {
        this.songs.addAll(songs);
    }
 
    public void addArtists(List<Artist> artists) {
        this.artists.addAll(artists);
    }
 
    public void promote() {
        System.out.println("Promoting album: " + title);
    }
 
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Album: " + title + "\n");
        sb.append("Songs: \n");
        for (Song s : songs) {
            sb.append(" - " + s + "\n");
        }
        sb.append("Artists: \n");
        for (Artist a : artists) {
            sb.append(" - " + a + "\n");
        }
        return sb.toString();
    }
}
 
class Song {
 
    private String title;
 
    public Song(String title) {
        this.title = title;
    }
 
    public String toString() {
        return title;
    }
}
 
class Artist {
 
    private String name;
 
    public Artist(String name) {
        this.name = name;
    }
 
    public String toString() {
        return name;
    }
}
 
class Playlist {
 
    private List<Song> songs;
 
    public Playlist() {
        this.songs = new ArrayList<Song>();
    }
 
    public void addSongs(List<Song> songs) {
        this.songs.addAll(songs);
    }
 
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Playlist: \n");
        for (Song s : songs) {
            sb.append(" - " + s + "\n");
        }
        return sb.toString();
    }
}
 
class RadioStation {
 
    private String name;
    private List<Song> songs;
 
    public RadioStation(String name) {
        this.name = name;
        this.songs = new ArrayList<Song>();
    }
 
    public void addSongs(List<Song> songs) {
        this.songs.addAll(songs);
    }
    
    public void broadcast() {
        System.out.println("Broadcasting songs on " + name);
        for (Song s : songs) {
            System.out.println(" - " + s);
        }
    }
 
    public String toString() {
        return name;
    }
}
 
class MusicStore {
 
    private String name;
    private List<Album> albums;
    private List<Song> songs;
 
    public MusicStore(String name) {
        this.name = name;
        this.albums = new ArrayList<Album>();
        this.songs = new ArrayList<Song>();
    }
 
    public void addAlbum(Album album) {
        albums.add(album);
    }
 
    public void addSongs(List<Song> songs) {
        this.songs.addAll(songs);
    }
 
    public void sellAlbum(Album album) {
        System.out.println("Selling album " + album.toString() + " at " + name);
    }
 
    public void sellSongs(List<Song> songs) {
        for (Song s : songs) {
            System.out.println("Selling song " + s + " at " + name);
        }
    }
 
    public String toString() {
        return name;
    }
}
 
class Fan {
 
    private String name;
    private List<Song> favorites;
    private List<Artist> followed;
 
    public Fan(String name) {
        this.name = name;
        this.favorites = new ArrayList<Song>();
        this.followed = new ArrayList<Artist>();
    }
 
    public void addFavorites(List<Song> songs) {
        favorites.addAll(songs);
    }
 
    public void followArtists(List<Artist> artists) {
        followed.addAll(artists);
    }
 
    public void buyAlbum(Album album) {
        System.out.println("Buying album " + album + " for " + name);
    }
 
    public void buySongs(List<Song> songs) {
        for (Song s : songs) {
            System.out.println("Buying song " + s + " for " + name);
        }
    }
 
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Fan: " + name + "\n");
        sb.append("Favorites: \n");
        for (Song s : favorites) {
            sb.append(" - " + s + "\n");
        }
        sb.append("Followed: \n");
        for (Artist a : followed) {
            sb.append(" - " + a + "\n");
        }
        return sb.toString();
    }
}
 
class MusicLabel {
 
    private String name;
    private List<Album> albums;
    private List<Artist> artists;
 
    public MusicLabel(String name) {
        this.name = name;
        this.albums = new ArrayList<Album>();
        this.artists = new ArrayList<Artist>();
    }
 
    public void addAlbum(Album album) {
        albums.add(album);
    }
 
    public void publishAlbum(Album album) {
        System.out.println("Publishing album " + album + " by " + name);
    }
 
    public void signArtists(List<Artist> artists) {
        this.artists.addAll(artists);
    }
    
    public void promoteAlbum(Album album) {
        System.out.println("Promoting album " + album + " by " + name);
    }
 
    public String toString() {
        return name;
    }
}