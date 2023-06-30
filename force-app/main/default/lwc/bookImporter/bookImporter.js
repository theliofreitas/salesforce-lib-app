import { LightningElement, api } from 'lwc';
import searchBooks from '@salesforce/apex/BookImporterController.searchBooks';

export default class BookImporter extends LightningElement {
    @api searchTerm = '';
    searchResults;
    startIndex = 0;
    maxResults = 15;

    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
    }

    handleSearch() {
        searchBooks({ searchTerm: this.searchTerm, startIndex: this.startIndex, maxResults: this.maxResults, api: 'GoogleBookAPI' })
            .then(response => {
                this.searchResults = response.results;
                console.log(response.totalResults);
                console.log(response.results);
            })
            .catch(error => {
                // Handle any error that occurred
                console.error('Error calling Apex method:', error);
            });
    }

    handleNextPage() {
        this.startIndex = this.startIndex + this.maxResults;
        this.handleSearch();
    }
}