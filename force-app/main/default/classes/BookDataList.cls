/**
 * Custom type to handle a list of Book records returned from the Book APIs
 */
public class BookDataList {
    @AuraEnabled public Integer totalResults;
    @AuraEnabled public List<BookData> results;
}