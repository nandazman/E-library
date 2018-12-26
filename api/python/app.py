from flask import Flask, request, json, make_response, session
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
from requests.utils import quote
import datetime
import os

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:Dewa626429@localhost:5432/E-library'
app.config['SECRET_KEY'] = os.urandom(24)

CORS(app)

db = SQLAlchemy(app)

class Books(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    book_title = db.Column(db.String())
    book_number = db.Column(db.Integer())
    publication_year = db.Column(db.Integer())
    author = db.Column(db.String())

class Borrowing(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    date_borrowing = db.Column(db.String())
    date_returning = db.Column(db.String())
    borrower_name = db.Column(db.String())
    book_number = db.Column(db.Integer())
    book_title = db.Column(db.String())

@app.route('/')
def test():
    return "Working"

### route for getting list of all books ###
@app.route('/books-list')
def booksList():
    if request.method == 'GET':

        bookList = Books.query.all()

        if bookList is not None:
            lists = []
            for data in bookList:
                
                lists.append(data.book_title)
            
            list = json.dumps(lists)

            return list, 200
        else:
            return 'No Books Found' , 404
    else:
        return 'Method Not Allowed', 405

### route for getting list of one book ###
@app.route('/number-of-books-list', methods=['POST'])
def numberOfBooks():
    
    if request.method == 'POST':
        
        request_data = request.get_json()
        title = request_data.get('title')
        bookList = Books.query.filter_by(book_title = title).all()

        if bookList is not None:
            lists = []
            for data in bookList:
                
                lists.append(data.book_number)
            
            list = json.dumps(lists)

            return list, 200
        else:
            return 'No Books Found' , 404
    else:
        return 'Method Not Allowed', 405
    
### route for post new books to database ###
@app.route('/submit-book', methods=['POST'])
def submitBook():
    if request.method == 'POST':
        request_data = request.get_json()
        title = request_data.get('title')
        number = request_data.get('number')
        year = request_data.get('year')
        author = request_data.get('author')

        newBook = Books(
            book_title = title,
            book_number = number,
            publication_year = year,
            author = author
        )
        db.session.add(newBook)
        db.session.commit()

        return 'Succes', 200
        
    else:
        return 'Method Not Allowed', 405

### route for post new borrwer to database ###    
@app.route('/submit-borrowed-data', methods=['POST'])
def submitBorrower():
    if request.method == 'POST':
        request_data = request.get_json()
        borrowed = request_data.get('borrowed-date')
        returned = request_data.get('returned-date')
        name = request_data.get('name')
        book = request_data.get('book')
        number = request_data.get('number')

        newBorrowing = Borrowing(
            date_borrowing = borrowed,
            date_returning = returned,
            borrower_name = name,
            book_number = number,
            book_title = book
        )
        db.session.add(newBorrowing)
        db.session.commit()

        return 'Succes', 200
        
    else:
        return 'Method Not Allowed', 405
 
### route for shows book data with history ###
@app.route('/book-data', methods=['POST'])
def showsBookData():
    if request.method == 'POST':
        request_data = request.get_json()
        title = request_data.get('title')
        number = request_data.get('number')

        ### Get book data
        booksData = Books.query.filter_by(book_number = number).first()
        book = {
            'title': booksData.book_title,
            'number': booksData.book_number,
            'year': booksData.publication_year,
            'author': booksData.author
        }

        ### Get history
        history = Borrowing.query.filter_by(book_number = number).all()
        
        histories = []
        for data in history:
            dataHistory = {
                'date_borrow': data.date_borrowing,
                'date_return': data.date_returning,
                'name': data.borrower_name,
            }
            histories.append(dataHistory)
        bookHistory = {
            'books_data': book,
            'histories': histories
        }
        
        bookHistory = json.dumps(bookHistory)
        return bookHistory, 200
        
    else:
        return 'Method Not Allowed', 405


if __name__ == '__main__':
    app.run(debug='true', host='localhost', port=7000)
