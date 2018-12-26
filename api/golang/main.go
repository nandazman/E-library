package main

import (
	"os"

	"github.com/labstack/echo"
)

func main(){
	e := echo.New()

	envFile := os.Getenv("ENV")
	if envFile == "" {
		envFile = ".env"
	}

	err := godotenv.Load(envFile)
	if err != nil {
		panic(err)
	}

	// Start echo on desired port
	e.Start(":" + os.Getenv("PORT"))
}