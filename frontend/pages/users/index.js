import { useEffect, useState } from 'react';

export default function UsersPage() {
	const [users, setUsers] = useState([]);
	const [loading, setLoading] = useState(true);
	const [error, setError] = useState(null);

	useEffect(() => {
		const load = async () => {
			try {
				const res = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/users`);
				if (!res.ok) throw new Error(`HTTP ${res.status}`);
				const data = await res.json();
				setUsers(Array.isArray(data) ? data : []);
			} catch (err) {
				setError(err?.message || 'Bilinmeyen hata');
			} finally {
				setLoading(false);
			}
		};
		load();
	}, []);

	return (
		<div>
			<h1>Kullanıcılar</h1>
			{loading && <p>Yükleniyor...</p>}
			{!loading && error && <p>Hata: {error}</p>}
			{!loading && !error && users.length === 0 && <p>Hiç kullanıcı yok.</p>}
			{!loading && !error && users.length > 0 && (
				<ul>
					{users.map((user) => (
						<li key={user.id}>{user.name}</li>
					))}
				</ul>
			)}
		</div>
	);
}


