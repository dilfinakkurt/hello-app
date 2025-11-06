## Week 1 Scenario: Users List (Rails API + Next.js)

### Run
1. Backend (WSL):
   - `bundle install`
   - `bin/rails db:prepare`
   - `bin/rails db:seed`
   - `bin/rails s -p 3001`
   - Test: `http://localhost:3001/api/v1/users`

2. Frontend:
   - `cd frontend`
   - `npm install`
   - `npm run dev`
   - Open: `http://localhost:3000/users`

### E2E Test (Cypress)
```
cd frontend
npm run cypress:open   # GUI
# or
npm run cypress:run    # headless
```

### Postman
- Import `postman/hello_app.postman_collection.json` and hit Users/Posts endpoints.

### Share
- Publish code on GitHub.
- Record a short demo (Users page loads list from API) and share on YouTube.
- Add the LinkedIn post; include mentors’ names as requested.

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
