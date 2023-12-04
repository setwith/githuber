# Githuber

Githuber is a Ruby on Rails application that allows you to retrieve information about GitHub users and their repositories.

## Installation

1. Clone the repository:

```bash
  git clone https://github.com/setwith/githuber.git
```

2. Navigate to the project directory:

```bash
  cd githuber
```

3. Install the gems:

```bash
  bundle
```

4. Start the server:

```bash
  rails s
```

## Usage

1. Visit `http://localhost:3000/` in your web browser.

2. On the homepage, enter the GitHub user's login in the form and click "Get Info."

3. User and repository information will be displayed on the page.

## Tests

Run tests to ensure the correctness of the application:

```bash
  rspec
```

## Requirements

This application is developed using:

- Ruby '3.1.2'
- Rails '~> 7.0.8'
- GraphQL
- Rspec for testing
