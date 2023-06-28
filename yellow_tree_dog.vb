Public Class MusicMatters
    Private Sub btnPlay_Click(sender As Object, e As EventArgs) Handles btnPlay.Click
        'create a player instance
        Dim player As WMPLib.WindowsMediaPlayer = New WMPLib.WindowsMediaPlayer()

        'check if the file path is valid
        If Not System.IO.File.Exists(txtFile.Text) Then
            MessageBox.Show("File not found. Please select one.")
            Return
        End If

        'play selected file
        'set the player file path
        player.URL = txtFile.Text

        'play the media
        player.controls.play()

        'update label text
        lblStatus.Text = "Now Playing: " & System.IO.Path.GetFileName(txtFile.Text)
    End Sub

    Private Sub btnSelect_Click(sender As Object, e As EventArgs) Handles btnSelect.Click
        'show file picker dialog
        If ofdMusic.ShowDialog() = DialogResult.OK Then
            'update file path text box
            txtFile.Text = ofdMusic.FileName
        End If
    End Sub

    Private Sub btnPause_Click(sender As Object, e As EventArgs) Handles btnPause.Click
        'create player instance
        Dim player As WMPLib.WindowsMediaPlayer = New WMPLib.WindowsMediaPlayer()

        'pause player
        player.controls.pause()

        'update label text
        lblStatus.Text = "Music Paused"
    End Sub

    Private Sub btnStop_Click(sender As Object, e As EventArgs) Handles btnStop.Click
        'create a player instance
        Dim player As WMPLib.WindowsMediaPlayer = New WMPLib.WindowsMediaPlayer()

        'stop player
        player.controls.stop()

        'update label text
        lblStatus.Text = "Music Stopped"
    End Sub

    Private Sub MusicMatters_FormClosing(sender As Object, e As FormClosingEventArgs) Handles MyBase.FormClosing
        'create player instance
        Dim player As WMPLib.WindowsMediaPlayer = New WMPLib.WindowsMediaPlayer()

        'stop player
        player.controls.stop()
    End Sub

    Private Sub txtFile_TextChanged(sender As Object, e As EventArgs) Handles txtFile.TextChanged
        'update label text
        lblStatus.Text = "File selected: " & System.IO.Path.GetFileName(txtFile.Text)
    End Sub

    Private Sub btnNext_Click(sender As Object, e As EventArgs) Handles btnNext.Click
        'create a player instance
        Dim player As WMPLib.WindowsMediaPlayer = New WMPLib.WindowsMediaPlayer()

        'get playlist list
        Dim playlist As WMPLib.IWMPPlaylist = player.currentPlaylist

        'go to next item in playlist
        player.controls.next()

        'update label text
        lblStatus.Text = "Now Playing: " & System.IO.Path.GetFileName(playlist.Item(playlist.count).name)
    End Sub

    Private Sub btnPrevious_Click(sender As Object, e As EventArgs) Handles btnPrevious.Click
        'create a player instance
        Dim player As WMPLib.WindowsMediaPlayer = New WMPLib.WindowsMediaPlayer()

        'get playlist list
        Dim playlist As WMPLib.IWMPPlaylist = player.currentPlaylist

        'go to previous item in playlist
        player.controls.previous()

        'update label text
        lblStatus.Text = "Now Playing: " & System.IO.Path.GetFileName(playlist.Item(playlist.count).name)
    End Sub

    Private Sub btnMute_Click(sender As Object, e As EventArgs) Handles btnMute.Click
        'create a player instance
        Dim player As WMPLib.WindowsMediaPlayer = New WMPLib.WindowsMediaPlayer()

        'mute player
        player.settings.mute = Not player.settings.mute

        'update label text
        lblStatus.Text = If(player.settings.mute, "Music Muted", "Music Unmuted")
    End Sub

    Private Sub MusicMatters_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'create a player instance
        Dim player As WMPLib.WindowsMediaPlayer = New WMPLib.WindowsMediaPlayer()

        'set the player sound level
        player.settings.volume = 50

        'update label text
        lblStatus.Text = "Music Volume Set to 50%"
    End Sub

    Private Sub tbVolume_Scroll(sender As Object, e As EventArgs) Handles tbVolume.Scroll
        'create a player instance
        Dim player As WMPLib.WindowsMediaPlayer = New WMPLib.WindowsMediaPlayer()

        'set the player sound level
        player.settings.volume = tbVolume.Value

        'update label text
        lblStatus.Text = "Music Volume Set to " & tbVolume.Value & "%"
    End Sub

    Private Sub tmProgress_Tick(sender As Object, e As EventArgs) Handles tmProgress.Tick
        'create a player instance
        Dim player As WMPLib.WindowsMediaPlayer = New WMPLib.WindowsMediaPlayer()

        'update progress bar
        pbProgress.Value = CInt(player.controls.currentPosition)
    End Sub
End Class