// pages/index.js (Ana sayfa)
import Link from 'next/link';

export default function Home() {
  return (
    <div>
      <h1>Hoş Geldiniz!</h1>
      <p>Frontend Calisiyor! RoR bağlantısını test edelim.</p>
      <Link href="/users">Kullanıcıları Görüntüle</Link>
    </div>
  );
}