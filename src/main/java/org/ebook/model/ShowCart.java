package org.ebook.model;

public class ShowCart {

    private int cartId;
    private int[] bookId;

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int[] getBookId() {
        return bookId;
    }

    public void setBookId(int[] bookId) {
        this.bookId = bookId;
    }
}
