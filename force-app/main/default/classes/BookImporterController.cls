public class BookImporterController {
    @AuraEnabled
    public static BookDataList searchBooks(String searchTerm, Integer startIndex, Integer maxResults, String api) {
        // TODO: Handle errors
        Type customType = Type.forName(api);

        BookService bookService = new BookService();
        bookService.setBookAPI((IBookAPI) customType.newInstance());

        return bookService.searchBooks(searchTerm, startIndex, maxResults);
    }
}