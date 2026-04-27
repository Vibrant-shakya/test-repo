# Operability Take-Home Exercise

## Overview

This project implements a lightweight HTTP API using FastAPI that retrieves public GitHub Gists for a given user.

The goal of this solution is to demonstrate **operability-focused engineering**, emphasizing:

* Simplicity
* Reliability
* Ease of deployment
* Testability

---

## Architecture

The application is a simple REST API that:

1. Accepts a GitHub username as input
2. Calls the GitHub public API
3. Returns the user’s public gists

**Flow:**

```
Client → FastAPI Service → GitHub API → Response → Client
```

---

## Tech Stack

* Python 3.11
* FastAPI (API framework)
* Uvicorn (ASGI server)
* Requests (HTTP client)
* Pytest (testing framework)
* Docker (containerization)

---

## Project Structure

```
project/
│── app/
│   └── main.py        # FastAPI application
│── tests/
│   └── test_api.py   # Test cases
│── requirements.txt
│── Dockerfile
│── README.md
```

---

## Features

* Fetch public GitHub gists by username
* Handles upstream API errors gracefully
* Lightweight and minimal implementation
* Automated test coverage
* Dockerized for consistent execution

---

## API Endpoints

### 1. Get User Gists

```
GET /{username}
```

**Example:**

```
http://localhost:8080/octocat
```

**Response:**

* Returns a JSON array of public gists from GitHub

---

## Prerequisites

Ensure the following are installed:

* Python 3.11+
* pip
* Docker (optional, for containerized run)

---

## Running the Application Locally

### 1. Clone Repository

```
git clone <repository-url>
cd project
```

### 2. Install Dependencies

```
pip install -r requirements.txt
```

### 3. Start the Server

```
uvicorn app.main:app --host 0.0.0.0 --port 8080
```

### 4. Access the API

Open in browser or use curl:

```
http://localhost:8080/octocat
```

---

## Running Tests

Execute:

```
python3 -m pytest
```

Expected:

* All tests should pass successfully

---

## Running with Docker

### 1. Build the Image

```
docker build -t gist-api .
```

### 2. Run the Container

```
docker run -p 8080:8080 gist-api
```

### 3. Verify Application

```
http://localhost:8080/octocat
```

---
