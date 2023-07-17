Public Class MusicMatters
	Public Sub New()
		MyBase.New
	End Sub

	Public Sub PlayMusic()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer.URL = "C:\Music\Song.mp3"
		mediaPlayer.Ctlcontrols.play()
	End Sub

	Public Sub StopMusic()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer.URL = "C:\Music\Song.mp3"
		mediaPlayer.Ctlcontrols.stop()
	End Sub

	Public Sub ChangeMusic(ByVal track As String)
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer.URL = track
		mediaPlayer.Ctlcontrols.play()
	End Sub

	Public Sub SetVolume(ByVal volume As Integer)
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer.settings.volume = volume
	End Sub

	Public Sub PauseMusic()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer.Ctlcontrols.pause()
	End Sub

	Public Sub ResumeMusic()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer.Ctlcontrols.play()
	End Sub

	Public Sub SavePosition()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		Dim position As Integer = mediaPlayer.Ctlcontrols.currentPosition
		'Save position to database
	End Sub

	Public Sub RestorePosition()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		'Retrieve position from database
		Dim position As Integer = 0 'Position retrieved from database
		mediaPlayer.Ctlcontrols.currentPosition = position
	End Sub

	Public Sub MuteMusic()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer.settings.mute = True
	End Sub

	Public Sub UnmuteMusic()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer.settings.mute = False
	End Sub

	Public Sub SavePlaylist()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		Dim playlist As WMPPlaylist = mediaPlayer.playlistCollection.newPlaylist("MyPlaylist")
		'Save Playlist to database
	End Sub

	Public Sub RestorePlaylist()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		'Retrieve Playlist from database
		Dim playlist As WMPPlaylist = New WMPPlaylist 'Playlist retrieved from database
		mediaPlayer.currentPlaylist = playlist
	End Sub

	Public Sub ChangeSongInPlaylist(ByVal songName As String)
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer.currentPlaylist.removeItem(mediaPlayer.currentMedia)
		Dim media As WMPMedia = mediaPlayer.newMedia(songName)
		mediaPlayer.currentPlaylist.appendItem(media)
		mediaPlayer.Ctlcontrols.play()
	End Sub

	Public Sub RepeatPlaylist()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer.settings.setMode("loop", True)
	End Sub

	Public Sub ShufflePlaylist()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer.settings.setMode("shuffle", True)
	End Sub

	Public Sub CreatePlaylist()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		Dim playlist As WMPPlaylist = mediaPlayer.playlistCollection.newPlaylist("MyPlaylist")
		For Each song As String In {"Song1.mp3", "Song2.mp3", "Song3.mp3"}
			Dim media As WMPMedia = mediaPlayer.newMedia(song)
			playlist.appendItem(media)
		Next
		mediaPlayer.currentPlaylist = playlist
	End Sub

	Public Sub SaveCollection()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		Dim library As WMPPlaylist = mediaPlayer.mediaCollection.getByName("Library")
		library.saveAs("C:\Music\Library.wpl")
	End Sub

	Public Sub RestoreCollection()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		Dim library As WMPPlaylist = mediaPlayer.mediaCollection.getByName("Library")
		library.load("C:\Music\Library.wpl")
		mediaPlayer.currentPlaylist = library
	End Sub

	Public Sub CreateCollection()
		Dim mediaPlayer As System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		mediaPlayer = New System.Windows.Forms.AxWMPLib.AxWindowsMediaPlayer
		Dim library As WMPPlaylist = mediaPlayer.mediaCollection.getByName("Library")
		Dim count As Integer = mediaPlayer.currentPlaylist.count
		For i As Integer = 0 To count - 1
			Dim media As WMPMedia = mediaPlayer.currentPlaylist.Item(i)
			library.appendItem(media)
		Next
		mediaPlayer.currentPlaylist = library
	End Sub

End Class