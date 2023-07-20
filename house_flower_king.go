package main

// Main Package

import (
	"fmt"
)

func main() {
	fmt.Println("Music Matters")
}

// Music structure to hold info
type Music struct {
	Artist string
	Album  string
	Genre  string
}

// Function to print music info
func printMusic(m Music) {
	fmt.Println("Artist:\t", m.Artist)
	fmt.Println("Album:\t", m.Album)
	fmt.Println("Genre:\t", m.Genre)
}

// Function to print a message
func printMessage(m string) {
	fmt.Println(m)
}

// Function to check if music is valid
func isMusicValid(m Music) bool {
	if m.Artist == "" || m.Album == "" || m.Genre == "" {
		return false
	}
	return true
}

// Function to create music
func createMusic(artist string, album string, genre string) Music {
	m := Music{
		Artist: artist,
		Album:  album,
		Genre:  genre,
	}
	return m
}

// Function to update music info
func updateMusic(m Music, artist string, album string, genre string) Music {
	m.Artist = artist
	m.Album = album
	m.Genre = genre
	return m
}

// Function to delete music
func deleteMusic(m Music) {
	m.Artist = ""
	m.Album = ""
	m.Genre = ""
}

// Function to check if music is equal
func isMusicEqual(m Music, m2 Music) bool {
	if m.Artist == m2.Artist && m.Album == m2.Album && m.Genre == m2.Genre {
		return true
	}
	return false
}

// Function to get music from the user
func getMusicFromUser() Music {
	var artist, album, genre string
	fmt.Print("Enter Artist: ")
	fmt.Scan(&artist)
	fmt.Print("Enter Album: ")
	fmt.Scan(&album)
	fmt.Print("Enter Genre: ")
	fmt.Scan(&genre)

	m := createMusic(artist, album, genre)
	return m
}

// Function to save music to a file
func saveMusicToFile(m Music) {
	f, err := os.OpenFile("music.txt", os.O_APPEND|os.O_WRONLY|os.O_CREATE, 0644)
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()

	musicString := fmt.Sprintf("%s\t%s\t%s\n", m.Artist, m.Album, m.Genre)
	if _, err = f.WriteString(musicString); err != nil {
		log.Fatal(err)
	}
}

// Function to read music from a file
func readMusicFromFile() []Music {
	f, err := os.OpenFile("music.txt", os.O_RDONLY, 0644)
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()

	var musics []Music
	s := bufio.NewScanner(f)
	for s.Scan() {
		line := s.Text()
		fields := strings.Split(line, "\t")
		artist := fields[0]
		album := fields[1]
		genre := fields[2]
		m := createMusic(artist, album, genre)
		musics = append(musics, m)
	}
	return musics
}

// Main execution
func main() {
	fmt.Println("Music Matters")

	// Create a music
	m := createMusic("John Mayer", "Continuum", "Rock")
	isValid := isMusicValid(m)
	if isValid {
		fmt.Println("Music is valid")
	} else {
		fmt.Println("Music is invalid")
	}
	
	// Print music
	printMusic(m)
	
	// Get music from user
	m2 := getMusicFromUser()
	
	// Update music
	m2 = updateMusic(m2, "John Mayer", "Born and Raised", "Country")
	
	// Print music
	printMessage("After updating music:")
	printMusic(m2)

	// Check if music is equal
	isEqual := isMusicEqual(m, m2)
	if isEqual {
		fmt.Println("Music is equal")
	} else {
		fmt.Println("Music is not equal")
	}

	// Delete music
	fmt.Println("Deleting music...")
	deleteMusic(m2)
	
	// Save music to a file
	saveMusicToFile(m)
	
	// Read music from a file
	musics := readMusicFromFile()
	for _, m := range musics {
		printMusic(m)
		fmt.Println()
	}

}