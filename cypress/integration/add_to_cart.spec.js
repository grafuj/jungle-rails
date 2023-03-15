describe('Add to cart', () => {
  beforeEach(() => {
    cy.visit('http://127.0.0.1:3000/');
  });

  it('Added an item to cart', () => {
    const cart = cy.get('.end-0 > .nav-link');
    cart.contains("My Cart (0)");
    cy.get(':nth-child(1) > div > .button_to')
      .submit();
    // cy.wait(200) //not required, cypress should handle this. if styles don't load, its a problem of cypressrails
    const cart2 = cy.get('.end-0 > .nav-link');
    cart2.contains("My Cart (1)");
  });
});