describe('Kullanıcılar Sayfası', () => {
	it('Listeyi backendden çeker ve gösterir', () => {
		cy.visit('/users');
		cy.contains('Kullanıcılar');
		// İçerik yüklenene kadar bekle (retry mekanizmasıyla)
		cy.contains('Ada Lovelace', { timeout: 30000 });
	});
});


