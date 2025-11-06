const { defineConfig } = require('cypress');

module.exports = defineConfig({
	e2e: {
		baseUrl: 'http://localhost:3000',
		video: true,
		// Show *.spec.js files (Cypress v10+ default looks for *.cy.*)
		specPattern: 'cypress/e2e/**/*.spec.js'
	}
});


