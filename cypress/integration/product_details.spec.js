describe('Product Details', () => {
  beforeEach(() => {
    cy.visit('http://127.0.0.1:3000/')
    // cy.contains("Looking for a way to add some life to your home?");
    cy.get("[alt='Cliff Collard']")
    .first()
    .click();
  })
  
  it('Loads the product', () => {
    cy.contains("The Cliff Collard is a very rare, tiny plant");
  })

})