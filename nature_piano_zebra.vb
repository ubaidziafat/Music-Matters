Public Class MusicMatters 

Dim Artist As String 

Private Sub MusicMatters_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load 

Artist = "Music Matters" 

End Sub 

Public Sub PlayMusic() 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.WaitToComplete) 

End Sub 

Public Sub StopMusic() 

My.Computer.Audio.Stop() 

End Sub 

Public Sub PlayPauseMusic() 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background) 

End Sub 

Public Sub SetMusicVolume(ByVal Volume As Integer) 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, Volume) 

End Sub 

Public Function GetArtist() As String 

Return Artist 

End Function 

Public Sub ShuffleTracks() 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, My.Computer.Audio.ShuffleQueue) 

End Sub 

Public Sub SkipTrackForward() 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, My.Computer.Audio.SkipForward) 

End Sub 

Public Sub SkipTrackBackward() 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, My.Computer.Audio.SkipBackward) 

End Sub 

Public Sub SetBalance(ByVal LeftVolume As Integer, ByVal RightVolume As Integer) 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, 0, LeftVolume, RightVolume) 

End Sub 

Public Sub SetPosition(ByVal Position As Integer) 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, Position) 

End Sub 

Public Sub SetTrackNum(ByVal TrackNum As Integer) 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, TrackNum) 

End Sub 

Public Sub RefreshTrack() 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, My.Computer.Audio.RefreshCurrentTrack) 

End Sub 

Public Sub SetRepeatMode(ByVal RepeatMode As Integer) 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, RepeatMode) 

End Sub 

Public Sub SetLoopCount(ByVal LoopCount As Integer) 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, LoopCount) 

End Sub 

Public Sub EnableRepeat() 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, My.Computer.Audio.EnableRepeat) 

End Sub 

Public Sub DisableRepeat() 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, My.Computer.Audio.DisableRepeat) 

End Sub 

Public Sub EnableShuffle() 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, My.Computer.Audio.EnableShuffle) 

End Sub 

Public Sub DisableShuffle() 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, My.Computer.Audio.DisableShuffle) 

End Sub 

Public Sub SetFadeTime(ByVal FadeTime As Integer) 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, FadeTime) 

End Sub 

Public Sub SetPanning(ByVal Panning As Integer) 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, Panning) 

End Sub 

Public Sub SetTreble(ByVal Treble As Integer) 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, Treble) 

End Sub 

Public Sub SetBass(ByVal Bass As Integer) 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, Bass) 

End Sub 

Public Sub ResetMusic() 

My.Computer.Audio.Play(My.Resources.MusicMatters, AudioPlayMode.Background, My.Computer.Audio.ResetMusic) 

End Sub 

End Class