# Agenda PDF

## Purpose
On the [Remarkable](https://remarkable.com/) you can use a PDF as a template. This will fill the blank page with the content of the PDF and you can write over it.

My wife loves to do her agenda on the Remarkable; so I created this gem so she can have a tool to do it alone whenever she wants.

## Setup
- Install ruby 3.0.2
- `bundle install`

## Usage
`bundle exec  agenda_pdf -m <yyyy-mm-dd> -o <output_file>.pdf`

Example:

`bundle exec  agenda_pdf -m 2023-08-21 -o test.pdf`
