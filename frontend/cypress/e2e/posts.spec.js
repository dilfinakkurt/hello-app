describe('Ana Sayfa', () => {
	it('Anasayfayı ziyaret eder', () => {
		cy.visit('/');
		cy.contains('Hoş Geldiniz!');
	});
});
