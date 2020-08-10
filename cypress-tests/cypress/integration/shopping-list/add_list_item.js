describe('Adding a list item', () => {
    beforeEach(() => {
        cy.visit('/');
    });
    it('adds an item', () => {
        cy.get('input#name')
          .type('Soap Flakes')
          .should('have.value', 'Soap Flakes')

        cy.contains('Add...').click();

        cy.get('table').should('contain', 'Soap Flakes');

        cy.get('input#name')
        .should('have.value', '');
    });
});