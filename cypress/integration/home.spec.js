describe('Homepage', () => {
  beforeEach(() => {
    cy.visit('http://127.0.0.1:3000/')
    // cy.contains("Looking for a way to add some life to your home?");
  })
  
  it('Loads the homepage', () => {
    cy.contains("Looking for a way to add some life to your home?");
  })
  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There are 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });
})