# Todo Application Backend

This is a backend API for a custom Todo Application.

## Features

- Create Users
- User Authentication and Authorization
- Creating, Updating, Reading and Deleting Tasks
- Manage User Sessions
- Request Header & JWT token based Authentication

## Tools and Technologies

The backend application has been developed using

- `Ruby on Rails 7`
- `Postgres Sql`

## API Reference

#### Required on all tasks requests and Session Create Request

| Header  | Type                | Description                  |
| :------ | :------------------ | :--------------------------- |
| `token` | `string: jwt token` | **Required**. Your Jwt token |

---

#### Get all Tasks

```http
  GET /tasks
```

#### Create Task

```http
  POST /tasks
```

#### Edit Task

```http
  PUT /tasks/${id}
```

| Parameter | Type     | Description              |
| :-------- | :------- | :----------------------- |
| `id`      | `string` | **Required**. Id of task |

### Delete Task

```http
  DELETE /tasks/${id}
```

| Parameter | Type     | Description              |
| :-------- | :------- | :----------------------- |
| `id`      | `string` | **Required**. Id of task |

### Create User

```http
  POST /users
```

| Parameter  | Type     | Description                    |
| :--------- | :------- | :----------------------------- |
| `name`     | `string` | **Required**. Name of user     |
| `email`    | `string` | **Required**. Email of user    |
| `password` | `string` | **Required**. Password of user |

### Create Session

```http
  POST /session
```

| Parameter  | Type     | Description                    |
| :--------- | :------- | :----------------------------- |
| `email`    | `string` | **Required**. Email of User    |
| `password` | `string` | **Required**. Password of User |

## Run Locally

To run locally, first make sure that you have the required dependencies installed

- Ruby 3.2.0
- Rails ~> 7.0.5
- Node >v14
- Postgresql@14

Clone the project

```bash
  git clone https://github.com/MoonRock000/todo-backend
```

Go to the project directory

```bash
  cd todo-backend
```

Install dependencies

```bash
  bundle install
```

Create DB

```bash
  rails db:create
```

Migrate the tables

```bash
  rails db:migrate
```

Start the server

```bash
  rails server
```

## Running Tests

To run tests, run the following command

Migrating Test DB tables

```bash
  rails db:migrate RAILS_ENV=test
```

Running Tests

```bash
rspec
```

## Authors

- [@Morris Emin](https://github.com/MoonRock000/)
