import Link from 'next/link';

export default function PostCard({ post }) {
  return (
    <div style={{ border: '1px solid #ddd', padding: '10px', marginBottom: '10px' }}>
      <h2>{post.title}</h2>
      <p>{post.body?.substring(0, 80)}...</p>
      <Link href={`/posts/${post.id}`}>Devamını oku →</Link>
    </div>
  );
}
