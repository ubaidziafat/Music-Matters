-- Music Matters

-- Main function
function MusicMatters()
    -- Set up variables
    local musicLibrary = {}
    local currentTrack = ""
    local trackPlaying = false
    local paused = false

    -- Function to add a track to the library
    function addTrack(trackName)
        table.insert(musicLibrary, trackName)
    end

    -- Function to play a track
    function playTrack(trackName)
        if trackName == currentTrack and not paused then
            trackPlaying = true
        else
            currentTrack = trackName
            trackPlaying = true
        end
    end

    -- Function to pause a track
    function pauseTrack(trackName)
        if trackName == currentTrack and trackPlaying then
            paused = true
            trackPlaying = false
        end
    end

    -- Function to resume a track
    function resumeTrack(trackName)
        if trackName == currentTrack and paused then
            paused = false
            trackPlaying = true
        end
    end

    -- Function to stop a track
    function stopTrack(trackName)
        if trackName == currentTrack and trackPlaying then
            currentTrack = ""
            trackPlaying = false
            paused = false
        end
    end

    -- Function to remove a track from the library
    function removeTrack(trackName)
        for i, v in ipairs(musicLibrary) do
            if v == trackName then
                table.remove(musicLibrary, i)
            end
        end
    end

    -- Function to display all tracks in the music library
    function printLibrary()
        for i, v in ipairs(musicLibrary) do
            print(v)
        end
    end

    -- Return functions
    return {
        addTrack = addTrack,
        playTrack = playTrack,
        pauseTrack = pauseTrack,
        resumeTrack = resumeTrack,
        stopTrack = stopTrack,
        removeTrack = removeTrack,
        printLibrary = printLibrary
    }
end

-- Use MusicMatters function
myMusicMatters = MusicMatters()

-- Add some tracks
myMusicMatters.addTrack("Track 1")
myMusicMatters.addTrack("Track 2")
myMusicMatters.addTrack("Track 3")

-- Print the library
myMusicMatters.printLibrary()

-- Play Track 1
myMusicMatters.playTrack("Track 1")

-- Pause Track 1
myMusicMatters.pauseTrack("Track 1")

-- Resume Track 1
myMusicMatters.resumeTrack("Track 1")

-- Stop Track 1
myMusicMatters.stopTrack("Track 1")

-- Remove Track 1
myMusicMatters.removeTrack("Track 1")

-- Print the library again
myMusicMatters.printLibrary()