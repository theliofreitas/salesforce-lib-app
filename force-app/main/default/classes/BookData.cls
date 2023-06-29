/**
 * Custom data structure to handle results from Book APIs
 */
public class BookData {
    @AuraEnabled public String externalId;
    @AuraEnabled public String title;
    @AuraEnabled public String description;
    @AuraEnabled public String imageUrl;
    @AuraEnabled public Integer pageCount;
    @AuraEnabled public List<String> categories;
    @AuraEnabled public List<String> authors;
}