// show list of all books from db
function showBooklist(){
    $.ajax({
        method: 'GET',
        url: 'http://localhost:7000/books-list',

        success: function(res){
            list = JSON.parse(res)
            
            list.forEach(data => {
                $('#list-books').append(`
                        <option value="${data}">${data}</option>
                    `)
                $('#list-data-books').append(`
                        <option value="${data}">${data}</option>
                    `)

                    
            });
        },
        error: function(err){
            alert(err.response)
        }
    })
}

// show how many books from one title for borrower
function showBooksNumber(){
    $.ajax({
        method: 'POST',
        url: 'http://localhost:7000/number-of-books-list',
        beforeSend: function(req) {
            req.setRequestHeader("Content-Type", "application/json");
        },
        data: JSON.stringify({
            'title': $('#list-books').val()
        }),

        success: function(res){
            list = JSON.parse(res)
            
            $('#list-number').empty()
            $('#list-number').append(`<option disabled selected>--Number of Book List--</option>`)
            list.forEach(data => {
                $('#list-number').append(`
                        <option value="${data}">${data}</option>
                    `)
            });
        },
        error: function(err){
            alert(err.response)
        }
    })
}

// show how many books from one title for history
function showBooksNumberForHistory(){
    $.ajax({
        method: 'POST',
        url: 'http://localhost:7000/number-of-books-list',
        beforeSend: function(req) {
            req.setRequestHeader("Content-Type", "application/json");
        },
        data: JSON.stringify({
            'title': $('#list-data-books').val()
        }),

        success: function(res){
            list = JSON.parse(res)
            $('#list-data-number').empty()
            $('#list-data-number').append(`<option disabled selected>--Number of Book List--</option>`)
            list.forEach(data => {
                $('#list-data-number').append(`
                        <option value="${data}">${data}</option>
                    `)
            });
        },
        error: function(err){
            alert(err.response)
        }
    })
}

// submit new books to db
function submitNewBook(){

    $.ajax({
        method: 'POST',
        url: 'http://localhost:7000/submit-book',
        beforeSend: function(req) {
            req.setRequestHeader("Content-Type", "application/json");
        },
        data: JSON.stringify({
            'title': $('#title').val(),
            'number' : $('#number').val(),
            "year": $('#year').val(),
            "author": $('#author').val()
        }),

        success: function(res){
            alert('Buku berhasil disubmit')
        },
        error: function(err){
            alert(err.response)
        }
    })
}

// submit new borrower to db
function submitBorrowedBookData(){
    if ($("#list-books").val() == null){
        alert('Pilih buku dahulu')
        return
    }
    if ($("#list-number").val() == null){
        alert('Pilih nomor dahulu')
        return
    }
    $.ajax({
        method: 'POST',
        url: 'http://localhost:7000/submit-borrowed-data',
        beforeSend: function(req) {
            req.setRequestHeader("Content-Type", "application/json");
        },
        data: JSON.stringify({
            'borrowed-date': $('#borrowed').val(),
            'returned-date' : $('#returned').val(),
            "name": $('#borrowed-name').val(),
            'book': $('#list-books').val(),
            "number": $('#list-number').val()
        }),

        success: function(res){
            alert('Peminjam baru berhasil disubmit')
        },
        error: function(err){
            alert(err.response)
        }
    })
    
}

// show data from one books with history
function showBookData(){
    if ($("#list-data-books").val() == null){
        alert('Pilih buku dahulu')
        return
    }
    if ($("#list-data-number").val() == null){
        alert('Pilih nomor dahulu')
        return
    }
    $.ajax({
        method: 'POST',
        url: 'http://localhost:7000/book-data',
        beforeSend: function(req) {
            req.setRequestHeader("Content-Type", "application/json");
        },
        data: JSON.stringify({
            'book': $('#list-data-books').val(),
            'number': $('#list-data-number').val()
        }),

        success: function(res){
            data = JSON.parse(res)
            console.log(data)
            $('#book-data').empty()
            $('#book-data').append(`<h3>Tahun Terbit</h3>
                <p>${data.books_data.year}</p>
                <h3>Pengarang</h3>
                <p>${data.books_data.author}</p>
                <h3>Judul Buku</h3>
                <p>${data.books_data.title}</p>
                <h3>No Buku</h3>
                <p>${data.books_data.number}</p>
                <h3>Riwayat Peminjaman</h3>`)
            $('#histories').empty()
            for (i = 0; i < data.histories.length; i++){
                $('#histories').append(`
                <h4>${i+1}</h4>
                <ul>
                    <li>Peminjam - ${data.histories[i].name}</li>
                    <li>Tanggal Peminjaman - ${data.histories[i].date_borrow}</li>
                    <li>Tanggal Pengembalian - ${data.histories[i].date_return}</li>
                </ul>
                `)
            }
        },
        error: function(err){
            alert(err.response)
        }
    })
    
}