describe('Add to Cart', () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("The cart should show 0", () => {
    cy.get('.end-0 > .nav-link')
      .contains("My Cart (0)");
  })

  it("The cart should increase by one when 'add to cart' is clicked", () => {
    cy.get(':nth-child(1) > div > .button_to > .btn')
      .click({ force: true });

      cy.get('.end-0 > .nav-link')
        .contains("My Cart (1)");
  });
})
