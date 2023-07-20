package musicmatters

import "fmt"

//Main Function
func main(){
	//Display greeting message
	fmt.Println("Welcome to Music Matters!")
	
	//Call function to search for music
	SearchMusic()
}

//SearchMusic takes user input to search for music
func SearchMusic(){
	//Declare variables
    var artistName string 
	var trackTitle string
	
	//Prompt user for artist name
	fmt.Println("Please enter the name of the artist you are looking for:")
	fmt.Scan(&artistName)

	//Prompt user for track title
	fmt.Println("Please enter the title of the track you are looking for:")
	fmt.Scan(&trackTitle)

	//Search for music
	Search(artistName,trackTitle)
}

//Search looks for music based on user input
func Search(artistName string, trackTitle string){
	//Create array to store music
	var music []string 

	//Loop through music array
	for _, m := range music {
		if artistName == m || trackTitle == m {
			fmt.Println("Music Found!")
			return
		}
	}

	//Display message if no music is found
	fmt.Println("No music found.")
}

//DownloadMusic downloads the desired music
func DownloadMusic(){
	//Create array to store music
	var music []string

	//Loop through music array
	for _, m := range music { 
		fmt.Println("Downloading...") 
	}
	
	//Display message that download is complete
	fmt.Println("Download complete!")
}

//SaveMusic saves the desired music
func SaveMusic(){
	//Create array to store music
	var music []string

	//Loop through music array
	for _, m := range music { 
		fmt.Println("Saving...") 
	}
	
	//Display message that save is complete
	fmt.Println("Save complete!")
}

//RateMusic prompts the user to rate the music
func RateMusic(){
	//Declare variable
	var rating int
	
	//Prompt user for rating
	fmt.Println("Please rate the music from 1 to 5:")
	fmt.Scan(&rating)

	//Update rating 
	UpdateRating(rating)
}

//UpdateRating updates the rating for the music
func UpdateRating(rating int){
	//Declare variable
	var totalRating int

	//Calculate total rating
	totalRating += rating

	//Display message
	fmt.Println("Rating Updated!")	
}

//ShareMusic shares the desired music
func ShareMusic(){
	//Declare variable
	var shareOption string

	//Prompt user for sharing option
	fmt.Println("Please choose a sharing option (Email/Twitter):")
	fmt.Scan(&shareOption)

	//Share music
	Share(shareOption)
}

//Share shares the desired music
func Share(shareOption string){
	if shareOption == "Email" {
		fmt.Println("Sending music via Email....")
	} else if shareOption == "Twitter" {
		fmt.Println("Posting music to Twitter....")
	}
	
	//Display message
	fmt.Println("Music shared!")	
}