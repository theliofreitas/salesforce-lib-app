public class BookImporterController {
    @AuraEnabled
    public static List<BookData> searchBooks(String searchTerm, String api) {
        // TODO: Handle errors
        Type customType = Type.forName(api);

        BookService bookService = new BookService();
        bookService.setBookAPI((IBookAPI) customType.newInstance());

        return bookService.searchBooks(searchTerm);
    }
}