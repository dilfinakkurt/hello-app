export default function Layout({ children }) {
  return (
    <div style={{ padding: '20px', fontFamily: 'sans-serif' }}>
      <nav style={{ marginBottom: '20px' }}>
        <a href="/">Ana Sayfa</a> | <a href="/users">Kullanıcılar</a>
      </nav>
      <main>{children}</main>
    </div>
  );
}
