// hello_app/frontend/next.config.js

/** @type {import('next').NextConfig} */
const nextConfig = {
  // .next derleme klasörünün mutlaka proje dizininde kalmasını sağlar
  distDir: '.next', 
  // API tabanı: .env yoksa geliştirici varsayılanına düşer
  env: {
    NEXT_PUBLIC_API_URL: process.env.NEXT_PUBLIC_API_URL || 'http://localhost:3001/api/v1'
  }
};

module.exports = nextConfig;