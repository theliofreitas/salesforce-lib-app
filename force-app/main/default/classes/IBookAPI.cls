/**
 * Common interface to all concrete strategies
 */
public interface IBookAPI {
    BookDataList searchBooks(String searchTerm, Integer startIndex, Integer maxResults);
    BookData getBook(String externalId);
}