describe('Product Detail', () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Navigates directly to a product detail page", () => {
    cy.get(':nth-child(1) > a > h1')
      .click({ force: true });
  });
})
