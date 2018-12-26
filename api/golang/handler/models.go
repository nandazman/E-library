package handler

import (
	"github.com/jinzhu/gorm"
)

// Books -
type Books struct {
	gorm.Model
	BookTitle       string
	BookNumber      int
	PublicationYear int
	Author          string
}

// Borrowing -
type Borrowing struct {
	gorm.Model
	DateBorrowing string
	DateReturning string
	BorrowerName  string
	BookNumber    int
	BookTitle     string
}
