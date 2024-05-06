## Pre-requisites

requires install:

- IDE [Visual Code | Ruby Mine | Or other compatible with Ruby]
- Ruby (version 2.7)

## Getting Started

First, install the latest packages with the command:

```bash
gem install bundler
```
gem install will donwload all dependencies present on the file [PASTA_RAIZ/Gemfile](./NOME_PROJETO/Gemfile)
```bash
bundle install
```

## Running Automation

For run all the test cases type the following command in the root project:

```bash
rspec
```

## The project is organized using the pageObject pattern

### How it's working

### Reports

The reports are automatic generated after running cucumber. to access open them in browser,
Reports are included in [PASTA_PROJETO/reports](./PASTA_PROJETO/reports)
with names `cucumber_relatorio.html` and `report.html`