package org.ebook.model;

public class Cart {

    private int idcart;
    private int bookId;

    public int getIdcart() {
        return idcart;
    }

    public void setIdcart(int idcart) {
        this.idcart = idcart;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "idcart=" + idcart +
                ", bookId=" + bookId +
                '}';
    }
}
