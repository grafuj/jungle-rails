describe('Product Details', () => {
  beforeEach(() => {
    cy.visit('http://127.0.0.1:3000/')
    // cy.contains("Looking for a way to add some life to your home?");
    cy.get("[alt='Scented Blade']")
    // .first() // first is for taking the first element of an array
    .click();
  })
  
  it('Loads the product', () => {
    cy.contains("The Scented Blade is an extremely rare, tall plant");
  })

})