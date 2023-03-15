// run the test server: rails s -b 0.0.0.0 -e test
// http://localhost:3000, not 0.0.0.0

describe('Homepage', () => {
  beforeEach(() => {
    cy.request('/cypress_rails_reset_state')
    cy.visit('http://0.0.0.0:3000')
  })
  
  it('Loads the homepage', () => {
    cy.contains("Looking for a way to add some life to your home?");
  })
  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There are 2 products on the test page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})
