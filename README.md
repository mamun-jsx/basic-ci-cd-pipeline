# Basic CI/CD Pipeline Practice

A simple Express.js Node.js application containerized with Docker.

## Scripts
- `npm start` - Starts the Express server (`index.js`) on port `4000`.

## Docker Commands
- Build Image: `docker build -t basic-ci-cd-app .`
- Run Container: `docker run -d -p 4000:4000 --name my-app basic-ci-cd-app`
